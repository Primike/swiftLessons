//
//  AL7AnimateableData.swift
//  SwiftUILessons
//
//  Created by Prince Avecillas on 7/11/23.
//

import SwiftUI

struct AL7AnimateableData: View {
    @State private var animate: Bool = false
    
    var body: some View {
        ZStack {
//            AL7RectangleSingleCornerAnimation(cornerRadius: animate ? 60 : 0)
            AL7Pacman(offsetAmount: animate ? 20 : 0)
                .frame(width: 250, height: 250)
        }
        .onAppear {
            withAnimation(Animation.easeInOut.repeatForever()) {
                animate.toggle()
            }
        }
    }
}

struct AL7AnimateableData_Previews: PreviewProvider {
    static var previews: some View {
        AL7AnimateableData()
    }
}

struct AL7RectangleSingleCornerAnimation: Shape {
    var cornerRadius: CGFloat
    
    var animatableData: CGFloat {
        get { cornerRadius }
        set { cornerRadius = newValue }
    }
    
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: .zero)
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY - cornerRadius))
            
            path.addArc(center: CGPoint(x: rect.maxX - cornerRadius, y: rect.maxY - cornerRadius), radius: cornerRadius, startAngle: Angle(degrees: 0), endAngle: Angle(degrees: 360), clockwise: false)
            
            path.addLine(to: CGPoint(x: rect.maxX - cornerRadius, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        }
    }
}

struct AL7Pacman: Shape {
    var offsetAmount: Double
    
    var animatableData: Double {
        get { offsetAmount }
        set { offsetAmount = newValue }
    }
    
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: CGPoint(x: rect.midX, y: rect.minY))
            path.addArc(center: CGPoint(x: rect.midX, y: rect.minY), radius: rect.height / 2, startAngle: Angle(degrees: offsetAmount), endAngle: Angle(degrees: 360 - offsetAmount), clockwise: false)
        }
    }
}
