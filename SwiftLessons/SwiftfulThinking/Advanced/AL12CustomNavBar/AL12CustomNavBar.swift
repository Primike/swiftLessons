//
//  AL12CustomNavBar.swift
//  SwiftUILessons
//
//  Created by Prince Avecillas on 7/15/23.
//

import SwiftUI

struct AL12CustomNavBar: View {
    
    @Environment(\.presentationMode) var presentationMode
    let showBackButton: Bool
    let title: String
    let subtitle: String?
    
    var body: some View {
        HStack {
            if showBackButton {
                backButton
            }
            Spacer()
            
            titleSection
            Spacer()
            
            if showBackButton {
                backButton
                    .opacity(0)
            }
        }
        .padding()
        .tint(.white)
        .foregroundColor(.white)
        .font(.headline)
        .background(Color.blue)
    }
}

extension AL12CustomNavBar {
    
    private var backButton: some View {
        Button {
            presentationMode.wrappedValue.dismiss()
        } label: {
            Image(systemName: "chevron.left")
        }
    }
    
    private var titleSection: some View {
        VStack(spacing: 4) {
            Text(title)
                .font(.title)
                .fontWeight(.semibold)
            if let subtitle = subtitle {
                Text(subtitle)
            }
        }
    }
}

struct AL12CustomNavBar_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            AL12CustomNavBar(showBackButton: true, title: "Title", subtitle: "Subtitle")
            Spacer()
        }
    }
}
