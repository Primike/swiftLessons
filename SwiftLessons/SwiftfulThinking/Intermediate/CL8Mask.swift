//
//  CL8Mask.swift
//  SwiftUILessons
//
//  Created by Prince Avecillas on 7/4/23.
//

import SwiftUI

struct CL8Mask: View {
    @State var rating: Int = 0

    var body: some View {
        ZStack {
            starsView
                .overlay(overlayView.mask(starsView))
        }
    }
    
    private var overlayView: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                Rectangle()
//                    .foregroundColor(.yellow)
                    .fill(LinearGradient(gradient: Gradient(colors: [.red, .blue]), startPoint: .leading, endPoint: .trailing))
                    .frame(width: CGFloat(rating) / 5 * geometry.size.width)
            }
        }
        .allowsHitTesting(false)
    }
    
    private var starsView: some View {
        HStack {
            ForEach(1..<6) { index in
                Image(systemName: "star.fill")
                    .font(.largeTitle)
                    .foregroundColor(rating >= index ? .yellow : .gray)
                    .onTapGesture {
                        withAnimation(.easeInOut) {
                            rating = index
                        }
                    }
            }
        }
    }
}

struct CL8Mask_Previews: PreviewProvider {
    static var previews: some View {
        CL8Mask()
    }
}
