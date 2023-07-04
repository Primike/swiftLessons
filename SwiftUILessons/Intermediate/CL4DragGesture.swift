//
//  CL4DragGesture.swift
//  SwiftUILessons
//
//  Created by Prince Avecillas on 7/2/23.
//

import SwiftUI

struct CL4DragGesture: View {
    
    @State var offset: CGSize = .zero
    
    var body: some View {
        ZStack {
            VStack {
                Text("\(offset.width)")
                Spacer()
            }
            
            RoundedRectangle(cornerRadius: 20)
                .frame(width: 300, height: 500)
                .offset(offset)
                .scaleEffect(getScaleAmount())
                .rotationEffect(Angle(degrees: getRotationAmount()))
                .gesture(
                    DragGesture()
                        .onChanged({ value in
                            withAnimation(.spring()) {
                                offset = value.translation
                            }
                        })
                        .onEnded({ value in
                            withAnimation(.spring()) {
                                offset = .zero
                            }
                        })
            )
        }
    }
    
    func getScaleAmount() -> CGFloat {
        let max = UIScreen.main.bounds.width / 2
        let currentAmount = abs(offset.width)
        let percentage = currentAmount / max
        
        return 1.0 - min(percentage, 0.5) * 0.5
    }
    
    func getRotationAmount() -> Double {
        let max = UIScreen.main.bounds.width / 2
        let currentAmount = offset.width
        let percentage = Double(currentAmount / max)
        let maxAngle: Double = 10
        
        return percentage * maxAngle
    }
}

struct CL4DragGesture2: View {
    
    @State var startingOffsetY: CGFloat = UIScreen.main.bounds.height * 0.85
    @State var currentDragOffsetY: CGFloat = 0
    @State var endingOffsetY: CGFloat = 0
    
    var body: some View {
        ZStack {
            Color.green.ignoresSafeArea()
            
            CL4LoginView()
                .offset(y: startingOffsetY)
                .offset(y: currentDragOffsetY)
                .offset(y: endingOffsetY)
                .gesture(
                    DragGesture()
                        .onChanged({ value in
                            withAnimation(.spring()) {
                                currentDragOffsetY = value.translation.height
                            }
                        })
                        .onEnded({ value in
                            withAnimation(.spring()) {
                                if currentDragOffsetY < -150 {
                                    endingOffsetY = -startingOffsetY
                                } else if endingOffsetY != 0 && currentDragOffsetY > 150 {
                                    endingOffsetY = 0
                                }
                                
                                currentDragOffsetY = 0
                            }
                        })
                )
        }
        .ignoresSafeArea(edges: .bottom)
    }
}

struct CL4LoginView: View {
    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "chevron.up")
                .padding(.top)
            
            Text("Sign up")
                .font(.headline)
                .fontWeight(.semibold)
            
            Image(systemName: "flame.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
            
            Text("App description")
                .multilineTextAlignment(.center)
            
            Text("Create acocund")
                .foregroundColor(.white)
                .font(.headline)
                .padding()
                .padding(.horizontal)
                .background(Color.black.cornerRadius(10))
            
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .background(Color.white)
        .cornerRadius(30)
    }
}

struct CL4DragGesture_Previews: PreviewProvider {
    static var previews: some View {
        CL4DragGesture2()
    }
}
