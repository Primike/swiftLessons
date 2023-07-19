//
//  AL10ScrollViewPreferenceKey.swift
//  SwiftUILessons
//
//  Created by Prince Avecillas on 7/13/23.
//

import SwiftUI

struct AL10ScrollViewOffsetKey: PreferenceKey {
    static var defaultValue: CGFloat = 0
    
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}

extension View {
    func onScrollViewOffsetChanged(action: @escaping (_ offset: CGFloat) -> Void) -> some View {
        self
            .background(
                GeometryReader { geo in
                    Text("")
                        .preference(key: AL10ScrollViewOffsetKey.self, value: geo.frame(in: .global).minY)
                }
            )
            .onPreferenceChange(AL10ScrollViewOffsetKey.self) { value in
                action(value)
            }
    }
}

struct AL10ScrollViewPreferenceKey: View {
    
    let title: String = "New Title"
    @State private var scrollViewOffset: CGFloat = 0
    
    var body: some View {
        ScrollView {
            VStack {
                titleLayer
                    .opacity(Double(scrollViewOffset / 63))
                    .onScrollViewOffsetChanged { offset in
                        self.scrollViewOffset = offset
                    }
                contentLayer
            }
            .padding()
        }
        .overlay(Text("\(scrollViewOffset)"))
        .overlay(
            navBarLayer
                .opacity(scrollViewOffset < 40 ? 1 : 0)
            , alignment: .top)
    }
}

extension AL10ScrollViewPreferenceKey {
    private var titleLayer: some View {
        Text(title)
            .font(.largeTitle)
            .fontWeight(.semibold)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    private var contentLayer: some View {
        ForEach(0..<30) { _ in
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.red.opacity(0.3))
                .frame(width: 300, height: 200)
        }
    }
    
    private var navBarLayer: some View {
        Text(title)
            .font(.headline)
            .frame(maxWidth: .infinity)
            .frame(height: 55)
            .background(Color.blue)
    }
}

struct AL10ScrollViewPreferenceKey_Previews: PreviewProvider {
    static var previews: some View {
        AL10ScrollViewPreferenceKey()
    }
}
