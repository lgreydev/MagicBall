//
//  Answers.swift
//  8ball
//
//  Created by Sergey Lukaschuk on 14.01.2022.
//

import Foundation
import UIKit

class MagicBall {

    // MARK: - Private Properties
    private let networkManager: NetworkManagerProtocol
    private let demoData: DemoDataProtocol

    // MARK: - Initializer
    init(networkManager: NetworkManagerProtocol = NetworkManager(), demoData: DemoDataProtocol = DemoData()) {
        self.networkManager = networkManager
        self.demoData = demoData
    }

    // MARK: - Public Methods
    func getAnswer(for label: UILabel) {
        networkManager.postRequest { result in
            switch result {
            case .success(let answer):
                label.text = answer
            case .failure(_):
                label.text = self.demoData.getRandomAnswer()
            }
        }
    }
}

