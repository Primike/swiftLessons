//
//  UdemyCombineViewModel.swift
//  SwiftLessons
//
//  Created by Prince Avecillas on 10/26/24.
//

import Foundation
import SwiftUI
import Combine

class UdemyCombineViewModel: ObservableObject {
    
    private var cancellables: Set<AnyCancellable> = []
    
    private enum CombineError: Error {
        case number
    }
    
    init() {
        cancellables.insert(NotificationCenter.default.publisher(for: UIDevice.orientationDidChangeNotification)
            .sink { _ in
                print(UIDevice.current.orientation.rawValue)
            }
        )
    }
    
    func justPublisher() {
        let publisher = Just(123)
        
        let cancellable = publisher.sink { completion in
            switch completion {
            case .finished:
                print("Finished all calls")
            case .failure(_):
                print("Error Just")
            }
        } receiveValue: { value in
            print("Recived \(value) from Just")
        }
    }
    
    func numbersPublisher() {
        let numbersPublisher = [1,2,3,4,5].publisher
        
        let cancellable = numbersPublisher.map { number in
            return number * 2
        }.sink { value in
            print(value)
        }
    }
    
    func timerPublisher() {
        let timerPublisher = Timer.publish(every: 1, on: .main, in: .common)
        
        let cancellable = timerPublisher.autoconnect().sink { timestamp in
            print(timestamp)
        }
    }
    
    func errorPublisher() {
        let numbersPublisher = [1,2,3,4,5].publisher
        
        /// When error thrown and completion reached subscription cancellation is unavoidable
        /// If using .catch{} this will replace and return a different subscription
        let errorPublisher = numbersPublisher.tryMap { value in
            guard value <= 3 else { throw CombineError.number }
            return value
        }
        
        /// When error is thrown the completion failure is called the error does not propogate
        /// There is no need for a do {} catch {} block
        errorPublisher.sink { completion in
            switch completion {
            case .finished:
                print("Done")
            case .failure(_):
                print("Error reached")
            }
        } receiveValue: { value in
            print("Recieved: \(value)")
        }

        print("")

        /// Error is caught and returns a new publisher. Just only returns one value
        errorPublisher.catch { _ in
            return Just(0)
        }.sink { value in
            print("Recieved: \(value)")
        }
    }
    
    func mapPublisher() {
        let namePublisher = ["John", "Mary", "Steven", "11"].publisher
        
        let flattenedPublisher = namePublisher.flatMap { name in
            name.publisher
        }
        
        let cancellable1 = flattenedPublisher.sink { char in
            print(char)
        }
        
        /// Compact map will only print the items that can become Integers
        let cancellable2 = namePublisher.compactMap{ Int($0) }.sink { char in
            print(char)
        }

    }
    
    func mergePublishers() {
        let publisher1 = [1,2,3].publisher
        let publisher2 = [4,5,6].publisher
        
        let mergedPublisher = Publishers.Merge(publisher1, publisher2)
        
        let cancellable1 = mergedPublisher.sink { value in
            print(value)
        }
        
        print("")
        
        let cancellable2 = publisher1.zip(publisher2).sink { (v1, v2) in
            print(v1, v2)
        }
    }
    
    /// Debounce only prints values every 2.0 seconds igonoring the ones in between time intervals
    func debouncePublisher() {
        let textPublisher = PassthroughSubject<String, Never>()
        
        let debouncedPublisher = textPublisher.debounce(for: .seconds(2.0), scheduler: DispatchQueue.main)
        
        let cancellable = debouncedPublisher.sink { value in
            print(value)
        }.store(in: &cancellables)
        
        textPublisher.send("A")
        textPublisher.send("B")
        textPublisher.send("C")
    }
    
    func passedThroughPublisher() {
        let outerPublisher = PassthroughSubject<AnyPublisher<Int, Never>, Never>()
        let innerPublisher1 = CurrentValueSubject<Int, Never>(1)
        let innerPublisher2 = CurrentValueSubject<Int, Never>(2)
        
        let cancellable = outerPublisher.switchToLatest().sink { value in
            print(value)
        }
        
        outerPublisher.send(AnyPublisher(innerPublisher1))
        innerPublisher1.send(10)
        
        outerPublisher.send(AnyPublisher(innerPublisher2))
        innerPublisher2.send(20)
        
        outerPublisher.send(AnyPublisher(Just(0)))
    }
    
    /// Retries can be used instead of manually resetting up the same publisher with .catch{}
    func retryPublisher() {
        let publisher = PassthroughSubject<Int, Error>()
        
        let retriedPublisher = publisher.tryMap { value in
            if value == 7 { throw CombineError.number }
            
            return value
        }.retry(1)
        
        let cancellable = retriedPublisher.sink { completion in
        } receiveValue: { value in
            print(value)
        }

        /// Retry only retries after 1 error
        publisher.send(1)
        publisher.send(7)
        publisher.send(2)
        publisher.send(7)
        publisher.send(3)
    }
    
    func debuggingPublisher() {
        let publisher = [1,2,3,4,5,6,7].publisher
        
        let cancellable = publisher
            .handleEvents(receiveSubscription: { _ in
                
            }, receiveOutput: { value in
                print(value)
            }, receiveCompletion: { completion in
                print("Completion: \(completion)")
            }, receiveCancel: {
                print("Canceled")
            }, receiveRequest: { _ in
                print("Receive Request")
            })
//            .print("DEBUG")
//            .breakpoint(receiveOutput: { value in
//                print(value > 4)
//                return value > 4
//            })
            .sink { value in
                print("Received: \(value)")
            }
    }
}

class EvenSubject<Failure: Error>: Subject {
    
    typealias Output = Int
    
    private let wrapped: PassthroughSubject<Int, Failure>

    init(_ initialValue: Int) {
        self.wrapped = PassthroughSubject()
        let evenInitialValue = initialValue % 2 == 0 ? initialValue : 0
        send(initialValue)
    }
    func send(_ value: Int) {
        if value % 2 == 0 { wrapped.send(value) }
    }
    
    func send(completion: Subscribers.Completion<Failure>) {
        wrapped.send(completion: completion)
    }
    
    func send(subscription: any Subscription) {
        wrapped.send(subscription: subscription)
    }
    
    func receive<S>(subscriber: S) where S : Subscriber, Failure == S.Failure, Int == S.Input {
        wrapped.receive(subscriber: subscriber)
    }
}

extension Publisher where Output == Int {
    func filterEvenNumbers() -> AnyPublisher<Int, Failure> {
        return self.filter { $0 % 2 == 0 }
            .eraseToAnyPublisher()
    }
    
    func filterNumberGreaterThan(_ value: Int) -> AnyPublisher<Int, Failure> {
        return self.filter { $0 > value }
            .eraseToAnyPublisher()
    }
}

extension Publisher {
    func mapAndFilter<T>(_ transform: @escaping (Output) -> T, _ isIncluded: @escaping (T) -> Bool) -> AnyPublisher<T, Failure> {
        return self
            .map { transform($0) }
            .filter{ isIncluded($0) }
            .eraseToAnyPublisher()
    }
}
