//
//  Answers.swift
//  8ball
//
//  Created by Sergey Lukaschuk on 14.01.2022.
//

import Foundation
import UIKit

class Answer {
    
    private let networkManager = NetworkManager()

    func get(for label: UILabel) {
        networkManager.postRequest { result in
            switch result {
            case .success(let answer):
                label.text = answer
            case .failure(_):
                label.text = DemoData.answers[Int.random(in: 0..<DemoData.answers.count)]
            }
        }
    }
}

