//
//  Answers.swift
//  8ball
//
//  Created by Sergey Lukaschuk on 14.01.2022.
//

import Foundation

class Answer {
    
    private let networkManager = NetworkManager()

    func get() -> String {
        var answer = ""
        networkManager.postRequest { result in
            switch result {
            case .success(let str):
                answer = str
            case .failure(_):
                answer = DemoData.answers[Int.random(in: 0..<DemoData.answers.count)]
            }
        }
        return answer
    }
}
