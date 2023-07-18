//
//  BC13InitsEnums.swift
//  SwiftUILessons
//
//  Created by Prince Avecillas on 3/19/23.
//

import SwiftUI

struct BC13InitsEnums: View {
    let backgroundColor: Color
    let count: Int
    let title: String
    
    enum Fruit {
        case apple
        case orange
    }

    init(count: Int, fruit: Fruit) {
        self.count = count
        
        switch fruit {
        case .apple:
            self.title = "Apples"
            self.backgroundColor = .red
        case .orange:
            self.title = "Oranges"
            self.backgroundColor = .orange
        }
    }
        
    var body: some View {
        VStack(spacing: 12) {
            Text("\(count)")
                .font(.largeTitle)
                .foregroundColor(.white)
                .underline()
            
            Text(title)
                .font(.headline)
                .foregroundColor(.white)
        }
        .frame(width: 150, height: 150)
        .background(backgroundColor)
        .cornerRadius(10)
    }
}

struct BC13InitsEnums_Previews: PreviewProvider {
    static var previews: some View {
        HStack {
            BC13InitsEnums(count: 100, fruit: .apple)
            BC13InitsEnums(count: 46, fruit: .orange)
        }
    }
}
