//
//  FirebaseSettingsView.swift
//  SwiftLessons
//
//  Created by Prince Avecillas on 4/30/24.
//

import SwiftUI

@MainActor
final class FirebaseSettingsViewModel: ObservableObject {
    func signOut() throws {
        try FirebaseAuthenticationManager.shared.signOut()
    }
}

struct FirebaseSettingsView: View {
    
    @StateObject private var viewModel = FirebaseSettingsViewModel()
    @Binding var showSignInView: Bool
    
    var body: some View {
        List {
            Button {
                Task {
                    do {
                        try viewModel.signOut()
                        showSignInView = true
                    } catch {
                        print(error.localizedDescription)
                    }
                }
            } label: {
                Text("Log out")
            }
        }
        .navigationTitle("Settings")
    }
}

#Preview {
    FirebaseSettingsView(showSignInView: .constant(false))
}
