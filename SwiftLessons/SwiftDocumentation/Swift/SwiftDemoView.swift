//
//  SwiftDemoView.swift
//  SwiftLessons
//
//  Created by Prince Avecillas on 3/11/24.
//

import SwiftUI

struct SwiftDemoView: View {
        
    let string: String = "\(SwiftDouble.isEqual(0.7, 0.8))"
    
    var body: some View {
        Text("\(SwiftClosures.returnForty())")
    }
}

#Preview {
    SwiftDemoView()
}
