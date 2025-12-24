//
//  BC36TextEditor.swift
//  SwiftUILessons
//
//  Created by Prince Avecillas on 6/18/23.
//

import SwiftUI

struct BC36TextEditor: View {
    
    @State var textEditorText: String = ""
    @State var savedText: String = ""
    
    var body: some View {
        NavigationView {
            VStack {
                TextEditor(text: $textEditorText)
                    .frame(height: 250)
//                    .foregroundColor(.red)
                    .colorMultiply(Color(uiColor: .lightGray).opacity(0.5))
                    .cornerRadius(10)
                    
                Button {
                    savedText = textEditorText
                } label: {
                    Text("Save".uppercased())
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(.blue)
                        .cornerRadius(10)
                }
                
                Text(savedText)
                
                Spacer()
            }
            .padding()
//            .background(.green)
            .navigationTitle("TextEditor Bootcamp!")
        }
    }
}

struct BC36TextEditor_Previews: PreviewProvider {
    static var previews: some View {
        BC36TextEditor()
    }
}
