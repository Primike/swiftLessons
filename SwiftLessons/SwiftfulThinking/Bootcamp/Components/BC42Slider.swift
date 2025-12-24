//
//  BC42Slider.swift
//  SwiftUILessons
//
//  Created by Prince Avecillas on 6/18/23.
//

import SwiftUI

struct BC42Slider: View {
    
    @State var sliderValue: Double = 3
    @State var color: Color = .red
    
    var body: some View {
        VStack {
            Text("Rating:")
            
            Text(String(format: "%.1f", sliderValue))
                .foregroundColor(color)
            
            Slider(value: $sliderValue, in: 1...5, step: 1.0) {
                Text("Title")
            } minimumValueLabel: {
                Text("1")
            } maximumValueLabel: {
                Text("5")
            } onEditingChanged: { _ in
                color = .green
            }
        }
        .padding()
    }
}

struct BC42Slider_Previews: PreviewProvider {
    static var previews: some View {
        BC42Slider()
    }
}
