//
//  FirebaseRootView.swift
//  SwiftLessons
//
//  Created by Prince Avecillas on 4/30/24.
//

import SwiftUI

struct FirebaseRootView: View {
    
    @State private var showSignInView: Bool = false
    
    var body: some View {
        ZStack {
            NavigationStack {
                FirebaseSettingsView(showSignInView: $showSignInView)
            }
        }
        .onAppear {
            let authUser = try? FirebaseAuthenticationManager.shared.getAuthenticatedUser()
            self.showSignInView = authUser == nil
        }
        .fullScreenCover(isPresented: $showSignInView, content: {
            NavigationStack {
                FirebaseAuthenticationView(showSignInView: $showSignInView)
            }
        })
    }
}

#Preview {
    FirebaseRootView()
}
