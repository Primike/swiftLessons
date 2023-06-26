//
//  BC60FocusState.swift
//  SwiftUILessons
//
//  Created by Prince Avecillas on 6/25/23.
//

import SwiftUI

struct BC60FocusState: View {
    
    enum OnboardingField: Hashable {
        case username
        case password
    }
    
    @State private var username: String = ""
//    @FocusState private var usernameInFocus: Bool
    @State private var password: String = ""
//    @FocusState private var passwordInFocus: Bool
    @FocusState private var fieldInFocus: OnboardingField?

    var body: some View {
        VStack {
            TextField("Add you name here ...", text: $username)
                .focused($fieldInFocus, equals: .username)
//                .focused($usernameInFocus)
                .padding(.leading)
                .frame(height: 55)
                .frame(maxWidth: .infinity)
                .background(Color.gray.brightness(0.3))
                .cornerRadius(10)
            
            SecureField("Add you password here ...", text: $password)
                .focused($fieldInFocus, equals: .username)
//                .focused($passwordInFocus)
                .padding(.leading)
                .frame(height: 55)
                .frame(maxWidth: .infinity)
                .background(Color.gray.brightness(0.3))
                .cornerRadius(10)

            Button("Sign up") {
                let usernameValid = !username.isEmpty
                let passwordVaild = !password.isEmpty
                if usernameValid && passwordVaild {
                    print("Sign up")
                } else if usernameValid {
                    fieldInFocus = .password
//                    usernameInFocus = false
//                    passwordInFocus = true
                } else {
                    fieldInFocus = .username
//                    usernameInFocus = true
//                    passwordInFocus = false
                }
            }
//            Button("Toggle Focus State") {
//                usernameInFocus.toggle()
//            }
        }
        .padding(40)
//        .onAppear {
//            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
//                self.usernameInFocus = true
//            }
//        }
    }
}

struct BC60FocusState_Previews: PreviewProvider {
    static var previews: some View {
        BC60FocusState()
    }
}
