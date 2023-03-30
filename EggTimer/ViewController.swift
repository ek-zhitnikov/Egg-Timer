//
//  ViewController.swift
//  EggTimer
//
//  Created by Кужельная Екатерина on 30.03.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var progressBar: UIProgressView!
    
    @IBOutlet weak var titleLable: UILabel!
    
    let eggTimes = ["Soft": 300, "Medium": 420, "Hard": 720]
    
    var secondsRemaning = 60
    
    var timer = Timer()
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        timer.invalidate()
        
        progressBar.progress = 1
        
        let hardness = sender.currentTitle!

        secondsRemaning = eggTimes[hardness]!
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer() {
        if secondsRemaning > 0{
            print("\(secondsRemaning) seconds.")
            secondsRemaning -= 1
        } else {
            timer.invalidate()
            titleLable.text = "DONE!"
        }
    }


}

