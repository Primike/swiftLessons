//
//  FirebaseSignInEmailView.swift
//  SwiftLessons
//
//  Created by Prince Avecillas on 4/28/24.
//

import SwiftUI

final class FirebaseSignInEmailViewModel: ObservableObject {
    
    @Published var email = ""
    @Published var password = ""
    
    func signIn() {
        guard !email.isEmpty, !password.isEmpty else {
            print("No email or password")
            return
        }
        
        Task {
            do {
                let returnedUserData = try await FirebaseAuthenticationManager.shared.createUser(email: email, password: password)
                print("Success")
                print(returnedUserData)
            } catch {
                print("error \(error.localizedDescription)")
            }
        }
    }
}

struct FirebaseSignInEmailView: View {
    
    @StateObject var viewModel = FirebaseSignInEmailViewModel()
    
    var body: some View {
        VStack {
            TextField("Email...", text: $viewModel.email)
                .padding()
                .background(.gray.opacity(0.4))
                .clipShape(RoundedRectangle(cornerRadius: 10))
            
            SecureField("Password...", text: $viewModel.password)
                .padding()
                .background(.gray.opacity(0.4))
                .clipShape(RoundedRectangle(cornerRadius: 10))

            Button {
                viewModel.signIn()
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
        .navigationTitle("Sign In With Email")
    }
}

#Preview {
    NavigationStack {
        FirebaseSignInEmailView()
    }
}
