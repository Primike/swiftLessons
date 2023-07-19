//
//  BC49CustomModels.swift
//  SwiftUILessons
//
//  Created by Prince Avecillas on 6/19/23.
//

import SwiftUI

struct BC49UserModel: Identifiable {
    let id: String = UUID().uuidString
    let displayName: String
    let userName: String
    let followerCount: Int
    let isVerified: Bool
}

struct BC49CustomModels: View {
    
    @State var users: [BC49UserModel] = [
        BC49UserModel(displayName: "Nick", userName: "nick123", followerCount: 100, isVerified: true),
        BC49UserModel(displayName: "Emily", userName: "itsemily1996", followerCount: 55, isVerified: false),
        BC49UserModel(displayName: "Samantha", userName: "ninja", followerCount: 355, isVerified: false),
        BC49UserModel(displayName: "Chris", userName: "chrish2009", followerCount: 88, isVerified: true),

    ]
    
    var body: some View {
        NavigationView {
            List {
                ForEach(users) { user in
                    HStack(spacing: 15) {
                        Circle()
                            .frame(width: 35, height: 35)
                        VStack(alignment: .leading) {
                            Text(user.displayName)
                                .font(.headline)
                            Text("@\(user.userName)")
                                .foregroundColor(.gray)
                                .font(.caption)
                        }
                        
                        Spacer()
                        
                        if user.isVerified {
                            Image(systemName: "checkmark.seal.fill")
                                .foregroundColor(.blue)
                        }
                        
                        VStack {
                            Text("\(user.followerCount)")
                                .font(.headline)
                            Text("Followers")
                                .foregroundColor(.gray)
                                .font(.caption)
                        }
                    }
                    .padding(.vertical, 10)
                }
            }
            .listStyle(InsetGroupedListStyle())
            .navigationTitle("Users")
        }
    }
}

struct BC49CustomModels_Previews: PreviewProvider {
    static var previews: some View {
        BC49CustomModels()
    }
}
