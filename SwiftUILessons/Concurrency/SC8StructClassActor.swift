//
//  SC8StructClassActor.swift
//  SwiftUILessons
//
//  Created by Prince Avecillas on 7/8/23.
//

import SwiftUI

struct SC8StructClassActor: View {
    var body: some View {
        Text("Hello, World!")
            .onAppear {
                runTest()
            }
    }
}

struct SC8StructClassActor_Previews: PreviewProvider {
    static var previews: some View {
        SC8StructClassActor()
    }
}

//When a structs propery changes it creates a new object
//views are reinit when properties change unlike VC
//StateObjects are never reinit
struct SC8MyStruct {
    var title: String
}

class SC8MyClass {
    var title: String
    
    init(title: String) {
        self.title = title
    }
}

//another way of changing values
struct SC8MutatingStruct {
    private(set) var title: String
    
    init(title: String) {
        self.title = title
    }
    
    mutating func updateTitle(newTitle: String) {
        title = newTitle
    }
}

actor SC8MyActor {
    var title: String
    
    init(title: String) {
        self.title = title
    }
    
    func updateTitle(newTitle: String) {
        title = newTitle
    }
}

extension SC8StructClassActor {
    private func runTest() {
        classTest()
    }
    
    private func structTest() {
        let objectA = SC8MyStruct(title: "Starting title")
        var objectB = objectA
        
        print("B: \(objectB.title), A: \(objectA.title)")
        
        objectB.title = "Second Title"
        print("B: \(objectB.title), A: \(objectA.title)")
    }
    
    private func classTest() {
        let objectA = SC8MyClass(title: "Starting title")
        let objectB = objectA
        
        print("B: \(objectB.title), A: \(objectA.title)")
        
        objectB.title = "Second Title"
        print("B: \(objectB.title), A: \(objectA.title)")
    }

    private func actorTest() {
        Task {
            let objectA = SC8MyActor(title: "Starting title")
            let objectB = objectA
            
            await print("B: \(objectB.title), A: \(objectA.title)")
            
            //Cant change actor properties from outside
//            objectB.title = "Second Title"
            await objectB.updateTitle(newTitle: "Second title")
            await print("B: \(objectB.title), A: \(objectA.title)")

        }
    }
}

/*
 VALUE TYPES:
 - Struct, Enum, String, Int
 - Stored in the Stack
 - Faster
 - Thread safe
 - When assigning new copy of data is created
 
 REFERENCE TYPES:
 - Classes, Function, Actor
 - Stored in the Heap
 - Slower, but synchronized
 - Not thread safe
 - When assigning a new reference is created
 
 STACKS:
 - Stores Value types
 - Variables on the stack are stored to the moemory, access is fast
 - Each thread has its own stack
 
 HEAP:
 - Stores reference types
 - Shared across threads
 */
