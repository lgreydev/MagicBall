//
//  ViewController.swift
//  8ball
//
//  Created by Sergey Lukaschuk on 13.01.2022.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var answerLabel: UILabel!
    
    private let answer = Answer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.becomeFirstResponder()
        answerLabel.text = "Shake me!"
    }
    
    // MARK: - Shake motion
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            answer.get(for: answerLabel)
        }
    }
}

