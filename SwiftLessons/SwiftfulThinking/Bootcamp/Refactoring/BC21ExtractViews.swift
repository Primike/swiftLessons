//
//  BC21ExtractViews.swift
//  SwiftUILessons
//
//  Created by Prince Avecillas on 3/20/23.
//

import SwiftUI

struct MyItem: View {
    
    let title: String
    let count: Int
    let color: Color
    
    var body: some View {
        VStack {
            Text("\(count)")
            Text(title)
        }
        .padding()
        .background(color)
        .cornerRadius(10)
    }
}

struct BC21ExtractViews: View {
    
    var body: some View {
        ZStack {
            Color(.cyan).ignoresSafeArea()
            
            contentLayer
        }
    }
    
    var contentLayer: some View {
        HStack {
            MyItem(title: "Apples", count: 1, color: .red)
            MyItem(title: "Oranges", count: 10, color: .orange)
            MyItem(title: "Bananas", count: 34, color: .yellow)
        }
    }
}

struct BC21ExtractViews_Previews: PreviewProvider {
    static var previews: some View {
        BC21ExtractViews()
    }
}
