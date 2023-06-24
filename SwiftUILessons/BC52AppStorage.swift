//
//  BC52AppStorage.swift
//  SwiftUILessons
//
//  Created by Prince Avecillas on 6/23/23.
//

import SwiftUI

struct BC52AppStorage: View {
    
//    @State var currentUserName: String?
    @AppStorage("name") var currentUserName: String?
    
    var body: some View {
        VStack(spacing: 20) {
            Text(currentUserName ?? "Add Name Here")
            
            if let name = currentUserName {
                Text(name)
            }
            
            Button("Save".uppercased()) {
                let name = "Doge"
                currentUserName = name
//                UserDefaults.standard.set(name, forKey: "name")
            }
        }
        .onAppear {
//            currentUserName = UserDefaults.standard.string(forKey: "name")
        }
    }
}

struct BC52AppStorage_Previews: PreviewProvider {
    static var previews: some View {
        BC52AppStorage()
    }
}
