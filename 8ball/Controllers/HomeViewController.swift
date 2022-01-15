//
//  ViewController.swift
//  8ball
//
//  Created by Sergey Lukaschuk on 13.01.2022.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var answer: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.becomeFirstResponder()
        NetworkManager.shared.postRequest()// To get shake gesture
    }
    
    
    // We are willing to become first responder to get shake motion
    override var canBecomeFirstResponder: Bool {
        get {
            answer.text = Answers.serverData.last
            return true
        }
    }
    
    // Enable detection of shake motion
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            NetworkManager.shared.postRequest()
            answer.text = Answers.serverData.last
            print(Answers.serverData)
        }
    }
}

