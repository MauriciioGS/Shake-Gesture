//
//  ViewController.swift
//  Shake Gesture
//
//  Created by Mauricio García S on 23/11/22.
//

import UIKit
import AVKit

class ViewController: UIViewController, AVAudioPlayerDelegate {
    
    var audioPlayer = AVAudioPlayer()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadSong()
    }
    
    func loadSong() {
        guard let url = Bundle.main.url(forResource: "loud_bang", withExtension: "mp3")
        else {
            print("Error no se localiza el recurso")
            return
        }
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        print("Sacudida!")
        audioPlayer.play()
    }


}

