//
//  Publishers.swift
//  SwiftLessons
//
//  Created by Prince Avecillas on 8/22/24.
//

import Foundation
import Combine

struct MyPublisher: Publisher {
    typealias Output = Int
    typealias Failure = Never
    
    // Define the method that will receive the subscriber
    func receive<S>(subscriber: S) where S : Subscriber, MyPublisher.Failure == S.Failure, MyPublisher.Output == S.Input {
        // Create a subscription
        let subscription = MySubscription(subscriber: subscriber)
        // Attach the subscription to the subscriber
        subscriber.receive(subscription: subscription)
    }
    
    // Custom subscription class
    private class MySubscription<S: Subscriber>: Subscription where S.Input == Int, S.Failure == Never {
        private var subscriber: S?
        
        init(subscriber: S) {
            self.subscriber = subscriber
        }
        
        // Required method: request demand for items
        func request(_ demand: Subscribers.Demand) {
            // Emit values based on demand
            var demandRemaining = demand
            
            while demandRemaining > 0 {
                let _ = subscriber?.receive(Int.random(in: 1...100))
                demandRemaining -= 1
            }
            
            // Signal completion
            subscriber?.receive(completion: .finished)
        }
        
        // Required method: cancel the subscription
        func cancel() {
            subscriber = nil
        }
    }
}
