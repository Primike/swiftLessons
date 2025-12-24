//
//  BC2Text.swift
//  SwiftUILessons
//
//  Created by Prince Avecillas on 3/19/23.
//

import SwiftUI

struct BC2Text: View {
    
    var body: some View {
        Text("Hello this is big chungus I am a big fat rabbit from cartoons. This is some text for Text.".capitalized)
//            .font(.body)
//            .fontWeight(.bold)
//            .bold()
//            .underline(true, color: .red)
//            .italic()
//            .strikethrough(true, color: .green)
//            .font(.system(size: 24, weight: .semibold, design: .serif))
//            .baselineOffset(50.0)
//            .kerning(10)
            .multilineTextAlignment(.leading)
            .foregroundColor(.red)
            .frame(width: 200, height: 100, alignment: .leading)
            .minimumScaleFactor(0.1)
            .textSelection(.enabled)
    }
}

struct BC2Text_Previews: PreviewProvider {
    static var previews: some View {
        BC2Text()
    }
}
