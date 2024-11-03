//
//  BC69NativePopover.swift
//  SwiftLessons
//
//  Created by Prince Avecillas on 10/23/24.
//

import SwiftUI

/// Popover that can be sheet, fullscreen cover, caption...
struct BC69NativePopover: View {
    
    @State private var showPopover: Bool = false
    @State private var feedbackOptions: [String] = [
        "Very Good 😀",
        "Average 😐",
        "Very Bad 😠"
    ]
    
    var body: some View {
        ZStack {
            Color.gray.ignoresSafeArea()
            
            VStack {
                Spacer()
                
                Button {
                    showPopover.toggle()
                } label: {
                    Text("Provide feedback?")
                }
                .padding(20)
                .background(Color.yellow)
                .popover(isPresented: $showPopover, attachmentAnchor: .point(.top)) {
                    ScrollView {
                        VStack(alignment: .leading, spacing: 12) {
                            ForEach(feedbackOptions, id: \.self) { option in
                                Button {
                                    
                                } label: {
                                    Text(option)
                                }
                                
                                if option != feedbackOptions.last {
                                    Divider()
                                }
                            }
                        }
                        .padding(20)
                    }
                    .presentationCompactAdaptation(.popover)
                }
            }
        }
    }
}

#Preview {
    BC69NativePopover()
}
