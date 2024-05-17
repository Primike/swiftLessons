//
//  SwiftGenerics.swift
//  SwiftLessons
//
//  Created by Prince Avecillas on 5/14/24.
//

import Foundation

class SwiftGenerics {
    
    static func findIndex<T: Equatable>(of valueToFind: T, in array:[T]) -> Int? {
        for (i, value) in array.enumerated() {
            if value == valueToFind { return i }
        }
        
        return nil
    }
    
    

    // Protocol with generic functions by using associatedTypes
    protocol MultiSwappable {
        associatedtype ItemA
        associatedtype ItemB
        associatedtype ItemC
        mutating func swapTwoValuesA(_ a: inout ItemA, _ b: inout ItemA)
        mutating func swapTwoValuesB(_ a: inout ItemB, _ b: inout ItemB)
        func getItem(_ item: ItemC)
    }
    // Typealias provides more clarity if needed stating which type is which
    struct GenericMultiSwappable<A, B>: MultiSwappable {
        typealias ItemA = A
        typealias ItemB = B
        typealias ItemC = String

        mutating func swapTwoValuesA(_ a: inout A, _ b: inout A) {
            let temporaryA = a
            a = b
            b = temporaryA
        }

        mutating func swapTwoValuesB(_ a: inout B, _ b: inout B) {
            let temporaryB = a
            a = b
            b = temporaryB
        }
        
        func getItem(_ item: ItemC) {
            print(item)
        }
    }
    
    
    
    // In order to compare the Containers must be of the same type and equatable
    private static func allItemsMatch<C1: Container, C2: Container>
            (_ container1: C1, _ container2: C2) -> Bool
            where C1.Item == C2.Item, C1.Item: Equatable {


        if container1.count != container2.count { return false }

        for i in 0..<container1.count {
            if container1[i] != container2[i] { return false }
        }

        return true
    }
}


private protocol Container {
    associatedtype Item
    mutating func append(_ item: Item)
    var count: Int { get }
    subscript(i: Int) -> Item { get }
}
private struct Stack<Element>: Container {

    var items: [Element] = []
    
    mutating func push(_ item: Element) {
        items.append(item)
    }
    mutating func pop() -> Element {
        return items.removeLast()
    }
    mutating func append(_ item: Element) {
        self.push(item)
    }
    var count: Int {
        return items.count
    }
    subscript(i: Int) -> Element {
        return items[i]
    }
}

private protocol SuffixableContainer: Container {
    associatedtype Suffix: SuffixableContainer where Suffix.Item == Item
    func suffix(_ size: Int) -> Suffix
}
extension Stack: SuffixableContainer {
    func suffix(_ size: Int) -> Stack {
        
        var result = Stack()
        
        for index in (count-size)..<count {
            result.append(self[index])
        }
        
        return result
    }
    // Inferred that Suffix is Stack.
}

// If you want to use this method then Element must be equatable
extension Stack where Element: Equatable {
    func isTop(_ item: Element) -> Bool {
        guard let topItem = items.last else { return false }
        return topItem == item
    }
}

extension Container where Item == Int {
    func average() -> Double {
        var sum = 0.0
        
        for index in 0..<count {
            sum += Double(self[index])
        }
        
        return sum / Double(count)
    }
}

