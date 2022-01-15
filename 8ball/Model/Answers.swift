//
//  Answers.swift
//  8ball
//
//  Created by Sergey Lukaschuk on 14.01.2022.
//

import Foundation

struct Answers {
    
  static var demoData = ["Just do it!", "You rock!", "All or nothing."]
  static var serverData: [String] = ["Shake me!"]

}

// MARK: - Welcome
struct Welcome: Codable {
    let magic: Magic
}

// MARK: - Magic
struct Magic: Codable {
    let question, answer, type: String
}
