//
//  ViewController.swift
//  8ball
//
//  Created by Sergey Lukaschuk on 13.01.2022.
//

import UIKit

class HomeViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet weak var answerLabel: UILabel!

    // MARK: - Private Properties
    private var magicBall = MagicBall()

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.becomeFirstResponder()
        answerLabel.text = "Shake me!"
    }
    
    // MARK: - Actions
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            magicBall.getAnswer(for: answerLabel)
        }
    }
}

