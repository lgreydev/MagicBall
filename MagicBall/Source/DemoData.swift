//
//  DemoData.swift
//  MagicBall
//
//  Created by Sergey Lukaschuk on 18.02.2022.
//

import Foundation


protocol DemoDataProtocol: AnyObject {
    func getRandomAnswer() -> String
}

class DemoData:  DemoDataProtocol {

    //MARK: - Singleton
    static var answers = ["Just do it! 🤠", "You rock!🤘", "OMG 😱" , "You are awesome 😎", "WTF 🤬"]

    // MARK: - Public Methods
    func getRandomAnswer() -> String {
        return DemoData.answers[Int.random(in: 0..<DemoData.answers.count)]
    }
}
