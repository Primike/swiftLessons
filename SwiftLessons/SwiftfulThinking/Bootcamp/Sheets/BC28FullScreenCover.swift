//
//  BC28FullScreenCover.swift
//  SwiftUILessons
//
//  Created by Prince Avecillas on 5/5/23.
//

import SwiftUI

struct BC28FullScreenCover: View {
    
    @State var showSheet: Bool = false
    @State var showFullScreenCover: Bool = false

    var body: some View {
        ZStack {
            Color.green
                .edgesIgnoringSafeArea(.all)
            
            HStack {
                Button(action: {
                    showSheet.toggle()
                }, label: {
                    Text("Show Sheet")
                        .foregroundColor(.green)
                        .font(.headline)
                        .padding(20)
                        .background(Color.white.cornerRadius(10))
                })
                
                Button(action: {
                    showFullScreenCover.toggle()
                }, label: {
                    Text("Show Cover")
                        .foregroundColor(.green)
                        .font(.headline)
                        .padding(20)
                        .background(Color.white.cornerRadius(10))
                })
            }
        }
        .sheet(isPresented: $showSheet, content: {
            //Dont add if/else
            BC28SecondScreen()
        })
        // Will create as soon as the view loads
        .fullScreenCover(isPresented: $showFullScreenCover, content: {
            BC28SecondScreen()
        })
    }
}

struct BC28SecondScreen: View {
    
    //required to dismiss view
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            Color.red
                .edgesIgnoringSafeArea(.all)
            
            Button(action: {
                presentationMode.wrappedValue.dismiss()
            }, label: {
                Image(systemName: "xmark")
                    .foregroundColor(.white)
                    .font(.largeTitle)
                    .padding(20)
            })
        }
    }
}

struct BC28FullScreenCover_Previews: PreviewProvider {
    static var previews: some View {
        BC28FullScreenCover()
    }
}
