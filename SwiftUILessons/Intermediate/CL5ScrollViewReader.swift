//
//  CL5ScrollViewReader.swift
//  SwiftUILessons
//
//  Created by Prince Avecillas on 7/4/23.
//

import SwiftUI

struct CL5ScrollViewReader: View {
    @State var scrollToIndex: Int = 0
    @State var textFieldText: String = ""

    var body: some View {
        VStack {
            TextField("Enter a number", text: $textFieldText)
                .frame(height: 55)
                .border(Color.gray)
                .padding(.horizontal)
                .keyboardType(.numberPad)
            
            Button("Scroll") {
                withAnimation(.spring()) {
                    if let index = Int(textFieldText) {
                        scrollToIndex = index
                    }
//                    proxy.scrollTo(30, anchor: .top)
                }
            }

            ScrollView {
                ScrollViewReader { proxy in
                    ForEach(0..<50) { index in
                        Text("This is item \(index)")
                            .font(.headline)
                            .frame(height: 200)
                            .frame(maxWidth: .infinity)
                            .background(Color.white)
                            .cornerRadius(10)
                            .shadow(radius: 10)
                            .padding()
                            .id(index)
                    }
                    .onChange(of: scrollToIndex) { value in
                        withAnimation(.spring()) {
                            proxy.scrollTo(value, anchor: .top)
                        }
                    }
                }
            }
        }
    }
}

struct CL5ScrollViewReader_Previews: PreviewProvider {
    static var previews: some View {
        CL5ScrollViewReader()
    }
}
