//
//  BC74ContentUnavailable.swift
//  SwiftLessons
//
//  Created by Prince Avecillas on 12/24/25.
//

import SwiftUI

struct BC74ContentUnavailable: View {
    
    var body: some View {
        if #available(iOS 17.0, *) {
            ContentUnavailableView("No Internet Connection", systemImage: "wifi.slash", description: Text("Please connect to the internet and try again"))
        } else {
        }
    }
}

#Preview {
    BC74ContentUnavailable()
}
