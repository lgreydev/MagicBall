//
//  RandomAnswer.swift
//  MagicBall
//
//  Created by Sergey Lukaschuk on 20.02.2022.
//

import Foundation

struct RandomAnswer {
    func get() -> String {
        return DemoData.answers[Int.random(in: 0..<DemoData.answers.count)]
    }
}
