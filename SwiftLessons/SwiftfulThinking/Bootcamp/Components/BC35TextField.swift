//
//  BC35TextField.swift
//  SwiftUILessons
//
//  Created by Prince Avecillas on 6/17/23.
//

import SwiftUI

struct BC35TextField: View {
    
    @State var textFieldText: String = ""
    @State var dataArray: [String] = []
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("Type something here...", text: $textFieldText)
                //                .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                    .background(Color.gray.opacity(0.3).cornerRadius(10))
                    .foregroundColor(.red)
                    .font(.headline)
                
                Button {
                    if textIsAppropriate() {
                        saveText()
                    }
                } label: {
                    Text("Save".uppercased())
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(textIsAppropriate() ? .blue : .gray)
                        .cornerRadius(10)
                        .foregroundColor(.white)
                        .font(.headline)
                }
                .disabled(!textIsAppropriate())
                
                ForEach(dataArray, id: \.self) { data in
                    Text(data)
                }
                
                Spacer()
            }
        }
        .padding()
        .navigationTitle("TextField Bootcamp!")
    }
    
    func textIsAppropriate() -> Bool {
        textFieldText.count >= 3 ? true : false
    }
    
    func saveText() {
        dataArray.append(textFieldText)
        textFieldText = ""
    }
}

struct BC35TextField_Previews: PreviewProvider {
    static var previews: some View {
        BC35TextField()
    }
}
