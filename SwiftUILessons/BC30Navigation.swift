//
//  BC30Navigation.swift
//  SwiftUILessons
//
//  Created by Prince Avecillas on 5/7/23.
//

import SwiftUI

struct BC30Navigation: View {
    var body: some View {
        //navigation view for title and stuff
        NavigationView {
            ScrollView {
                
                NavigationLink("Hello", destination: BC30MyOtherScreen())
                
                Text("Hello")
                Text("Hello")
                Text("Hello")
            }
            .navigationTitle("All Inboxes")
//            .navigationBarTitleDisplayMode(.inline)
//            .toolbar(.hidden)
            .navigationBarItems(
                leading: HStack {
                    Image(systemName: "person.fill")
                    Image(systemName: "flame.fill")
                },
                
                trailing: NavigationLink(destination: {
                    BC30MyOtherScreen()
                }, label: {
                    Image(systemName: "gear")
                })
            )
            .accentColor(.red)
        }
    }
}

struct BC30MyOtherScreen: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack {
            Color.green.edgesIgnoringSafeArea(.all)
                .navigationTitle("Green")
//                .toolbar(.hidden)
            
            VStack {
                Button("Back Button") {
                    presentationMode.wrappedValue.dismiss()
                }
                                
                NavigationLink("Click") {
                    Text("3rd screen")
                }
            }
        }
    }
}

struct BC30Navigation_Previews: PreviewProvider {
    static var previews: some View {
        BC30Navigation()
    }
}
