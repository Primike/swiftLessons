//
//  AL10GeometryPreference.swift
//  SwiftUILessons
//
//  Created by Prince Avecillas on 7/13/23.
//

import SwiftUI

struct AL10GeometryPreference: View {
    
    @State private var rectSize: CGSize = .zero
    
    var body: some View {
        VStack {
            Text("Hello")
                .frame(width: rectSize.width, height: rectSize.height)
                .background(Color.blue)
            
            Spacer()
            
            HStack {
                Rectangle()
                
                GeometryReader { geo in
                    Rectangle()
                        .updateRectangleGeoSize(geo.size)
                }
                
                Rectangle()
            }
            .frame(height: 55)
        }
        .onPreferenceChange(AL10GeometryPreferenceKey.self) { value in
            rectSize = value
        }
    }
}

extension View {
    func updateRectangleGeoSize(_ size: CGSize) -> some View {
        preference(key: AL10GeometryPreferenceKey.self, value: size)
    }
}

struct AL10GeometryPreferenceKey: PreferenceKey {
    static var defaultValue: CGSize = .zero
    
    static func reduce(value: inout CGSize, nextValue: () -> CGSize) {
        value = nextValue()
    }
}

struct AL10GeometryPreference_Previews: PreviewProvider {
    static var previews: some View {
        AL10GeometryPreference()
    }
}
