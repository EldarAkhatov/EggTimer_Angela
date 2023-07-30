//
//  ViewController.swift
//  EggTimer_Angela
//
//  Created by Эльдар Ахатов on 27/07/23.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    
    
    @IBOutlet weak var progressBarOutlet: UIProgressView!
    @IBOutlet weak var titleLabelOutlet: UILabel!
    
    let eggTime = ["Soft": 3, "Medium": 4, "Hard": 7]
    var timer = Timer()
    
    var secondsPassed = 0
    var timeAllocated = 0
    var player = AVAudioPlayer()
    
    
    
    @IBAction func chooseEggHardness(_ sender: UIButton) {
        
        timer.invalidate()
        
        let hardness = sender.currentTitle!
        timeAllocated = eggTime[hardness]!
        
        progressBarOutlet.progress = 0.0
        secondsPassed = 0
        titleLabelOutlet.text = hardness
        
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        
        
        
    }
    
    
    
    
    @objc func updateTimer() {
        if secondsPassed < timeAllocated {
            
            secondsPassed += 1
            
            let percentage = Float(secondsPassed) / Float(timeAllocated)
            progressBarOutlet.progress = percentage
            
            
            
        } else {
            timer.invalidate()
            titleLabelOutlet.text = "It's done"
            
            let url = Bundle.main.url(forResource: "alarm_sound", withExtension: ".mp3")
            player = try! AVAudioPlayer(contentsOf: url!)
            player.play()
            
            
        }
        
    }
    
}

