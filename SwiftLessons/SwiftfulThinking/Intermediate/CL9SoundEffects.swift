//
//  CL9SoundEffects.swift
//  SwiftUILessons
//
//  Created by Prince Avecillas on 7/4/23.
//

import SwiftUI
import AVKit

class CL9SoundManager {
    static let shared = CL9SoundManager()
    
    var player: AVAudioPlayer?
    
    enum SoundOption: String {
        case tada
        case badum
    }
    
    private init() {}
    
    func playSound(sound: SoundOption) {
        guard let url = Bundle.main.url(forResource: sound.rawValue, withExtension: ".mp3") else { return }
        
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
        } catch let error {
            print("Error playing sound. \(error.localizedDescription)")
        }
    }
    
}

struct CL9SoundEffects: View {
    
    var body: some View {
        VStack(spacing: 40) {
            Button("Play 1") {
                CL9SoundManager.shared.playSound(sound: .tada)
            }
            Button("Play 2") {
                CL9SoundManager.shared.playSound(sound: .badum)
            }

        }
    }
}

struct CL9SoundEffects_Previews: PreviewProvider {
    static var previews: some View {
        CL9SoundEffects()
    }
}
