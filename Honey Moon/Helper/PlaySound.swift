//
//  PlaySound.swift
//  Honey Moon
//
//  Created by Adriancys Jesus Villegas Toro on 16/11/23.
//

import AVFoundation

var audioPlayer: AVAudioPlayer?

func playSound(sound: String, type: String) {
    if let path = Bundle.main.path(forResource: sound, ofType: type) {
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
            audioPlayer?.play()
        }catch {
            print("ERROR: Couldn't find an play the sound file!")
        }
    }
}
