//
//  ViewController.swift
//  8ball
//
//  Created by Sergey Lukaschuk on 13.01.2022.
//

import UIKit

class HomeViewController: UIViewController {

    let answers = [
    "Shake me down!",
    "Stronger",
    "Come on!",
    "So you have warmed up!"
    ]
    
    @IBOutlet weak var answer: UILabel!
    
    var counter = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.becomeFirstResponder() // To get shake gesture
    }

    
    // We are willing to become first responder to get shake motion
    override var canBecomeFirstResponder: Bool {
        get {
            answer.text = answers[0]
            return true
        }
    }
    
    // Enable detection of shake motion
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            if counter < 3 {
                counter += 1
                answer.text = answers[counter]
            } else {
                counter = 0
                answer.text = answers[counter]
            }
        }
    }
    
}

