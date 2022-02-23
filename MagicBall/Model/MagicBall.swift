//
//  Answers.swift
//  8ball
//
//  Created by Sergey Lukaschuk on 14.01.2022.
//

import Foundation
import UIKit

class MagicBall {
    
    private let networkManager: NetworkManagerProtocol
    private let randomAnswer = RandomAnswer()
    
    init(networkManager: NetworkManagerProtocol = NetworkManager()) {
        self.networkManager = networkManager
    }
    
    func getAnswer(for label: UILabel) {
        networkManager.postRequest { result in
            switch result {
            case .success(let answer):
                label.text = answer
            case .failure(_):
                label.text = self.randomAnswer.get()
            }
        }
    }
}

