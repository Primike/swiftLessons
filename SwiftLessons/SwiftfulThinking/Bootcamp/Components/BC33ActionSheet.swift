//
//  BC33ActionSheet.swift
//  SwiftUILessons
//
//  Created by Prince Avecillas on 6/15/23.
//

import SwiftUI

struct BC33ActionSheet: View {
    
    @State var showActionSheet: Bool = false
    @State var actionSheetOption: ActionSheetOptions = .isMyPost
    
    enum ActionSheetOptions {
        case isMyPost
        case isOtherPost
    }
    
    var body: some View {
        VStack {
            HStack {
                Circle()
                    .frame(width: 30, height: 30)
                
                Text("@username")
                
                Spacer()
                
                Button {
                    showActionSheet.toggle()
                } label: {
                    Image(systemName: "ellipsis")
                }
                .accentColor(.primary)
            }
            .padding(.horizontal)
            
            Rectangle()
                .aspectRatio(1.0, contentMode: .fit)
        }
        .confirmationDialog("what would you like to do", isPresented: $showActionSheet, titleVisibility: .visible) {
            getButtons()
        }
    }
    
    @ViewBuilder
    func getButtons() -> some View {
        Button("Share") {
            
        }
        
        switch actionSheetOption {
        case .isOtherPost:
            Button("Report", role: .destructive) {
                
            }
        case .isMyPost:
            Button("Delete", role: .destructive) {
                
            }
        }
        
        Button("Cancel", role: .cancel) {
            
        }
    }
}

struct BC33ActionSheet_Previews: PreviewProvider {
    static var previews: some View {
        BC33ActionSheet()
    }
}
