//
//  BC61KeyboardSubmit.swift
//  SwiftUILessons
//
//  Created by Prince Avecillas on 6/25/23.
//

import SwiftUI

struct BC61KeyboardSubmit: View {
    
    @State private var text: String = ""
    
    var body: some View {
        VStack {
            TextField("Placeholder...", text: $text)
                .submitLabel(.route)
                .onSubmit {
                    print("Return pressed")
                }
            
            TextField("Placeholder...", text: $text)
                .submitLabel(.next)
                .onSubmit {
                    print("Return pressed")
                }
            
            TextField("Placeholder...", text: $text)
                .submitLabel(.search)
                .onSubmit {
                    print("Return pressed")
                }
        }
        .padding()
    }
}

struct BC61KeyboardSubmit_Previews: PreviewProvider {
    static var previews: some View {
        BC61KeyboardSubmit()
    }
}
