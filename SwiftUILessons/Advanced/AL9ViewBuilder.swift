//
//  AL9ViewBuilder.swift
//  SwiftUILessons
//
//  Created by Prince Avecillas on 7/11/23.
//

import SwiftUI

struct Al9HeaderViewGeneric<Content: View>: View {
    
    let title: String
    let content: Content
    
    init(title: String, @ViewBuilder content: () -> Content) {
        self.title = title
        self.content = content()
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.largeTitle)
                .fontWeight(.semibold)
            
            content
            
            RoundedRectangle(cornerRadius: 5)
                .frame(height: 2)
        }
        .frame(maxWidth: .infinity,  alignment: .leading)
        .padding()
    }
}

struct AL9HStack<Content: View>: View {
    let content: Content

    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        HStack {
            content
        }
    }
}

struct AL9ViewBuilder: View {
    var body: some View {
        VStack {
            Al9HeaderViewGeneric(title: "Title") {
                VStack {
                    Text("Doge")
                }
            }
            
            AL9HStack {
                Text("Big")
                Text("Chungus")
            }
            Spacer()
        }
    }
}

struct AL9ViewBuilder_Previews: PreviewProvider {
    static var previews: some View {
        AL9ViewBuilder()
    }
}

struct AL9LocalViewBuilder: View {
    
    enum ViewType {
        case one, two, three
    }
    
    let type: ViewType
    
    var body: some View {
        VStack {
            headerSection
        }
    }
    
    @ViewBuilder private var headerSection: some View {
        switch type {
        case .one:
            view1
        case .two:
            view2
        case .three:
            view3
        }
    }
    
    private var view1: some View {
        Text("One")
    }
    
    private var view2: some View {
        VStack {
            Text("Two")
            Image(systemName: "heart.fill")
        }
    }

    private var view3: some View {
        Image(systemName: "heart.fill")
    }
}
