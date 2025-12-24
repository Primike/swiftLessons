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
    
    @FocusState private var fieldInFocus: OnboardingField?
    @State private var username: String = ""
    @State private var password: String = ""

    var body: some View {
        VStack {
            TextField("Add you name here ...", text: $username)
                .focused($fieldInFocus, equals: .username)
                .padding(.leading)
                .frame(height: 55)
                .frame(maxWidth: .infinity)
                .background(Color.gray.brightness(0.3))
                .cornerRadius(10)
            
            SecureField("Add you password here ...", text: $password)
                .focused($fieldInFocus, equals: .password)
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
                } else {
                    fieldInFocus = .username
                }
            }
        }
        .padding(40)
    }
}

struct BC60FocusState_Previews: PreviewProvider {
    static var previews: some View {
        BC60FocusState()
    }
}
