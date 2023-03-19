//
//  BC9Overlays.swift
//  SwiftUILessons
//
//  Created by Prince Avecillas on 3/19/23.
//

import SwiftUI

struct BC9Overlays: View {
    var body: some View {
//        BC9OverlaysGradient()
//        BC9OverlaysCircle()
//        BC9OverlaysRectangle()
        BC9OverlaysIconNotification()
    }
}

struct BC9Overlays_Previews: PreviewProvider {
    static var previews: some View {
        BC9Overlays()
    }
}


struct BC9OverlaysGradient: View {
    var body: some View {
        Text("Hello, World!")
            .background(
                Circle()
                    .fill(LinearGradient(gradient: Gradient(colors: [.red, .blue]), startPoint: .leading, endPoint: .trailing))
                    .frame(width: 100, height: 100, alignment: .center)
            )
            .background(
                Circle()
                    .fill(LinearGradient(gradient: Gradient(colors: [.blue, .red]), startPoint: .leading, endPoint: .trailing))
                    .frame(width: 120, height: 120, alignment: .center)
            )

    }
}


struct BC9OverlaysCircle: View {
    var body: some View {
        Circle()
            .fill(.pink)
            .frame(width: 100, height: 100, alignment: .center)
            .overlay(
                Text("1")
                    .font(.largeTitle)
                    .foregroundColor(.white)
            )
            .background(
                Circle()
                    .fill(.purple)
                    .frame(width: 110, height: 110, alignment: .center)
            )
    }
}

struct BC9OverlaysRectangle: View {
    var body: some View {
        Rectangle()
            .frame(width: 100, height: 100)
            .overlay(
                Rectangle()
                    .fill(.blue)
                    .frame(width: 50, height: 50)
                , alignment: .topLeading
            )
            .background(
                Rectangle()
                    .fill(.red)
                    .frame(width: 150, height: 150)
                , alignment: .bottomTrailing
            )
    }
}

struct BC9OverlaysIconNotification: View {
    var body: some View {
        Image(systemName: "heart.fill")
            .font(.system(size: 40))
            .foregroundColor(.white)
            .background(
                Circle()
                    .fill(
                        LinearGradient(gradient: Gradient(colors: [.pink, .purple]), startPoint: .topLeading, endPoint: .bottomTrailing)
                    )
                    .frame(width: 100, height: 100)
                    .shadow(color: .pink, radius: 10, x: 0.0, y: 10)
                    .overlay(
                        Circle()
                            .fill(.blue)
                            .frame(width: 35, height: 35)
                            .overlay(
                                Text("5")
                                    .font(.headline)
                                    .foregroundColor(.white)
                            )
                            .shadow(color: .purple, radius: 10, x: 5, y: 5)
                        , alignment: .bottomTrailing
                    )
            )
    }
}
