//
//  BC41Stepper.swift
//  SwiftUILessons
//
//  Created by Prince Avecillas on 6/18/23.
//

import SwiftUI

struct BC41Stepper: View {
    
    @State var stepperValue: Int = 10
    @State var widthIncrement: CGFloat = 0
    
    var body: some View {
        VStack {
            Stepper("Stepper \(stepperValue)", value: $stepperValue)
                .padding(50)
            
            RoundedRectangle(cornerRadius: 25)
                .frame(width: 100 + widthIncrement, height: 100)
            
            Stepper("Stepper 2") {
                incrementWidth(amount: 10)
            } onDecrement: {
                incrementWidth(amount: -10)
            }
            .padding(50)
        }
    }
    
    func incrementWidth(amount: CGFloat) {
        withAnimation(.easeInOut) {
            widthIncrement += amount
        }
    }
}

struct BC41Stepper_Previews: PreviewProvider {
    static var previews: some View {
        BC41Stepper()
    }
}
