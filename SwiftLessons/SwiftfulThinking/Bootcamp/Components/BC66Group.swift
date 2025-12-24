//
//  BC66Group.swift
//  SwiftLessons
//
//  Created by Prince Avecillas on 10/20/24.
//

import SwiftUI

struct BC66Group: View {
    
    var body: some View {
        VStack(spacing: 50) {
            Text("Hello")
            
            Group {
                Text("Hello")
                Text("Hello")
            }
            .font(.caption)
            .foregroundStyle(.green)
        }
        .foregroundStyle(.red)
        .font(.headline)
    }
}

#Preview {
    BC66Group()
}
