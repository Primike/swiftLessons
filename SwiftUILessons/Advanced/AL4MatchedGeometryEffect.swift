//
//  AL4MatchedGeometryEffect.swift
//  SwiftUILessons
//
//  Created by Prince Avecillas on 7/10/23.
//

import SwiftUI

struct AL4MatchedGeometryEffect: View {
    @State private var isClicked: Bool = false
    @Namespace private var namespace
    
    var body: some View {
        VStack {
            if !isClicked {
                RoundedRectangle(cornerRadius: 25)
                    .matchedGeometryEffect(id: "rectangle", in: namespace)
                    .frame(width: 100, height: 100)
    //                .offset(y: isClicked ? UIScreen.main.bounds.height * 0.7 : 0)
            }
            
            Spacer()
            
            if isClicked {
                RoundedRectangle(cornerRadius: 25)
                    .matchedGeometryEffect(id: "rectangle", in: namespace)
                    .frame(width: 300, height: 200)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.red)
        .onTapGesture {
            withAnimation(.easeInOut) {
                isClicked.toggle()
            }
        }
    }
}

struct AL4Screen2: View {
    let categories: [String] = ["Home", "Popular", "Saved"]
    @State private var selected: String = ""
    @Namespace private var namespace2
    
    var body: some View {
        HStack {
            ForEach(categories, id: \.self) { category in
                ZStack(alignment: .bottom) {
                    if selected == category {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.red.opacity(0.5))
                            .matchedGeometryEffect(id: "category", in: namespace2)
                            .frame(width: 35, height: 2)
                            .offset(y: 10)
                    }
                    
                    Text(category)
                        .foregroundColor(selected == category ? .red : .black)
                }
                .frame(maxWidth: .infinity)
                .frame(height: 55)
                .onTapGesture {
                    withAnimation(.spring(blendDuration: 0.5)) {
                        selected = category
                    }
                }
            }
        }
        .padding()
    }
}

struct AL4MatchedGeometryEffect_Previews: PreviewProvider {
    static var previews: some View {
        AL4Screen2()
    }
}
