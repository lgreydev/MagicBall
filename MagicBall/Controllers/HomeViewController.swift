//
//  ViewController.swift
//  8ball
//
//  Created by Sergey Lukaschuk on 13.01.2022.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var answer: UILabel!
    
    private let networkManager = NetworkManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.becomeFirstResponder()
        answer.text = "Shake me!"
    }
    
    // MARK: - Shake motion
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            networkManager.postRequest { result in
                switch result {
                case .success(let str):
                    self.answer.text = str
                case .failure(_):
                    self.answer.text = Answers.demoData[Int.random(in: 0..<Answers.demoData.count)]
                }
            }
        }
    }
}

