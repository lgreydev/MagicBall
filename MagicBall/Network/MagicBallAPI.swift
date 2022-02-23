//
//  8ballAPI.swift
//  8ball
//
//  Created by Sergey Lukaschuk on 15.01.2022.
//

import Foundation


// MARK: - MagicBallAPI
struct MagicBallAPI: Codable {
    let magic: Magic
}

// MARK: - Magic
struct Magic: Codable {
    let question, answer, type: String
}
