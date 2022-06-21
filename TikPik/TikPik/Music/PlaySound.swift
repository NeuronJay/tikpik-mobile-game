//
//  PlaySound.swift
//  TikPik
//
//  Created by Dev, Jay on 3/31/22.
//

import Foundation
import AVFoundation

var audioPlayer: AVAudioPlayer?

func playSound(sound: String, type: String)
{
    if let path = Bundle.main.path(forResource: sound, ofType: type)
    {
        do{
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
            audioPlayer?.play()
        } catch{
            print("Error. Couldn't find the sound file.")
        }
    }
}

