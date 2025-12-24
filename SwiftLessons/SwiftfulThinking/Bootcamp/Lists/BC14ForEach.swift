//
//  BC14ForEach.swift
//  SwiftUILessons
//
//  Created by Prince Avecillas on 3/19/23.
//

import SwiftUI

struct BC14ForEach: View {
    
    let data: [String] = ["Hi", "Hello", "Hey everyone"]
    let myString: String = "Hello"
    
    var body: some View {
        VStack {
            ForEach(data.indices, id: \.self) { index in
                Text("\(data[index]): \(index)")
            }
            ForEach(0..<5) { index in
                Circle()
                    .frame(height: 50)
            }
        }
    }
}

struct BC14ForEach_Previews: PreviewProvider {
    static var previews: some View {
        BC14ForEach()
    }
}
