//
//  BC41Stepper.swift
//  SwiftUILessons
//
//  Created by Prince Avecillas on 6/18/23.
//

import SwiftUI

struct BC41Stepper: View {
    
    @State var stepperValue: Int = 10
    @State var width: CGFloat = 100
    
    var body: some View {
        VStack {
            Stepper("Stepper \(stepperValue)", value: $stepperValue)
                .padding(50)
            
            RoundedRectangle(cornerRadius: 25)
                .frame(width: width, height: 100)
            
            Stepper("Width \(width)") {
                incrementWidth(amount: 20)
            } onDecrement: {
                incrementWidth(amount: -20)
            }
            .padding(50)
        }
    }
    
    func incrementWidth(amount: CGFloat) {
        withAnimation(.easeInOut) {
            width = max(0, width + amount)
        }
    }
}

struct BC41Stepper_Previews: PreviewProvider {
    static var previews: some View {
        BC41Stepper()
    }
}
