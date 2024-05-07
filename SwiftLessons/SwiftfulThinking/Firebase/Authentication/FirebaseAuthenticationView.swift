//
//  FirebaseAuthenticationView.swift
//  SwiftLessons
//
//  Created by Prince Avecillas on 4/28/24.
//

import SwiftUI

struct FirebaseAuthenticationView: View {
    
    @Binding var showSignInView: Bool
    
    var body: some View {
        VStack {
            NavigationLink {
                FirebaseSignInEmailView(showSignInView: $showSignInView)
            } label: {
                Text("Sign in with email")
                    .font(.headline)
                    .foregroundStyle(.white)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(.blue)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            }
            
            Spacer()
        }
        .padding()
        .navigationTitle("Sign In")
    }
}

#Preview {
    FirebaseAuthenticationView(showSignInView: .constant(false))
}
