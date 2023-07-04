//
//  CL10HapticsVibrations.swift
//  SwiftUILessons
//
//  Created by Prince Avecillas on 7/4/23.
//

import SwiftUI

class CL10HapticManager {
    static let shared = CL10HapticManager()
    
    private init() {}
    
    func notification(type: UINotificationFeedbackGenerator.FeedbackType) {
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(type)
    }
    
    func impact(style: UIImpactFeedbackGenerator.FeedbackStyle) {
        let generator = UIImpactFeedbackGenerator(style: style)
        generator.impactOccurred()
    }
}
struct CL10HapticsVibrations: View {
    var body: some View {
        VStack(spacing: 20) {
            Button("success") {
                CL10HapticManager.shared.notification(type: .success)
            }
            Button("warning") {
                CL10HapticManager.shared.notification(type: .warning)
            }
            Button("error") {
                CL10HapticManager.shared.notification(type: .error)
            }
            
            Divider()
            
            Button("soft") {
                CL10HapticManager.shared.impact(style: .soft)
            }
            Button("light") {
                CL10HapticManager.shared.impact(style: .light)
            }
            Button("medium") {
                CL10HapticManager.shared.impact(style: .medium)
            }
            Button("rigid") {
                CL10HapticManager.shared.impact(style: .rigid)
            }
            Button("heavy") {
                CL10HapticManager.shared.impact(style: .heavy)
            }
        }
    }
}

struct CL10HapticsVibrations_Previews: PreviewProvider {
    static var previews: some View {
        CL10HapticsVibrations()
    }
}
