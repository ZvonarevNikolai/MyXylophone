//
//  ViewController.swift
//  MyXylophone
//
//  Created by Nikolai Zvonarev on 27.01.2023.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    var player: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    @IBAction func keyPressed(_ sender: UIButton) {
    
        playSound(soundName: sender.currentTitle!)
        //Уменьшаем прозрачность кнопки до 0,5
        sender.alpha = 0.5
        
        //Добавляем задержку прозрачности 0,2 сек и возвращаем прозрачность до 1
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            sender.alpha = 1.0
        }
    }
    
    func playSound(soundName: String) {
        let url = Bundle.main.url(forResource: soundName, withExtension: "wav")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
    }
}

