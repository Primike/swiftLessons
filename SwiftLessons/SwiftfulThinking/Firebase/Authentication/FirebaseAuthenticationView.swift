//
//  FirebaseAuthenticationView.swift
//  SwiftLessons
//
//  Created by Prince Avecillas on 4/28/24.
//

import SwiftUI

struct FirebaseAuthenticationView: View {
    var body: some View {
        VStack {
            NavigationLink {
                FirebaseSignInEmailView()
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
    FirebaseAuthenticationView()
}
