//
//  BC53IntroView.swift
//  SwiftUILessons
//
//  Created by Prince Avecillas on 6/24/23.
//

import SwiftUI

struct BC53IntroView: View {
    
    @AppStorage("signed_in") var currentUserSignedIn: Bool = false
    
    var body: some View {
        ZStack {
            RadialGradient(gradient: Gradient(colors: [.pink, .purple]), center: .center, startRadius: 5, endRadius: UIScreen.main.bounds.height)
                .ignoresSafeArea()
            
            if currentUserSignedIn {
                BC53ProfileView()
                    .transition(.asymmetric(insertion: .move(edge: .bottom), removal: .move(edge: .top)))
            } else {
                BC53OnboardingView()
                    .transition(.asymmetric(insertion: .move(edge: .top), removal: .move(edge: .bottom)))
            }
        }
    }
}

struct BC53IntroView_Previews: PreviewProvider {
    static var previews: some View {
        BC53IntroView()
    }
}
