//
//  BC29Popover.swift
//  SwiftUILessons
//
//  Created by Prince Avecillas on 5/7/23.
//

import SwiftUI

struct BC29Popover: View {
    
    @State var showNewScreen: Bool = false
    
    var body: some View {
        ZStack {
            Color.orange
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Button("Button") {
                    showNewScreen.toggle()
                }
                .font(.largeTitle)
                
                Spacer()
            }
//            .sheet(isPresented: $showNewScreen) {
//                BC29NewScreen()
//            }
            
//            ZStack {
//                if showNewScreen {
//                    BC29NewScreen(showNewScreen: $showNewScreen)
//                        .padding(.top, 100)
//                        .transition(.move(edge: .bottom))
//                        .animation(.spring(), value: showNewScreen)
//                }
//            }
//            .zIndex(2.0)
            
            BC29NewScreen(showNewScreen: $showNewScreen)
//                .padding(.top, 100)
                .offset(y: showNewScreen ? UIScreen.main.bounds.height/2 : UIScreen.main.bounds.height)
                .animation(.spring(), value: showNewScreen)
        }
    }
}

struct BC29NewScreen: View {
    
    @Environment(\.presentationMode) var presentationMode
    @Binding var showNewScreen: Bool
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            Color.purple
                .edgesIgnoringSafeArea(.all)
            
            Button {
//                presentationMode.wrappedValue.dismiss()
                showNewScreen.toggle()
            } label: {
                Image(systemName: "xmark")
                    .foregroundColor(.white)
                    .font(.largeTitle)

                .padding(20)            }

        }
    }
}

struct BC29Popover_Previews: PreviewProvider {
    static var previews: some View {
        BC29Popover()
    }
}
