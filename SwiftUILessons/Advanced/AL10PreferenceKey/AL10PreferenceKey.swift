//
//  AL10PreferenceKey.swift
//  SwiftUILessons
//
//  Created by Prince Avecillas on 7/12/23.
//

import SwiftUI

struct AL10PreferenceKey: View {
    
    @State private var text: String = "Hello"
    
    var body: some View {
        NavigationView {
            VStack {
                AL10SecondScreen(text: text)
                    .navigationTitle("Title")
            }
        }
        .onPreferenceChange(AL10CustomPreferenceKey.self) { value in
            self.text = value
        }
    }
}

struct AL10SecondScreen: View {
    
    let text: String
    @State private var newValue: String = ""
    
    var body: some View {
        Text(text)
            .onAppear(perform: getData)
            .customTitle(text: newValue)
    }
    
    func getData() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.newValue = "New database fetch"
        }
    }
}

struct AL10CustomPreferenceKey: PreferenceKey {
    static var defaultValue: String = ""
    
    static func reduce(value: inout String, nextValue: () -> String) {
        value = nextValue()
    }
}

extension View {
    func customTitle(text: String) -> some View {
        preference(key: AL10CustomPreferenceKey.self, value: text)
    }
}

struct AL10PreferenceKey_Previews: PreviewProvider {
    static var previews: some View {
        AL10PreferenceKey()
    }
}
