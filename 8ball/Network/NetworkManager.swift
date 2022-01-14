//
//  NetworkManager.swift
//  8ball
//
//  Created by Sergey Lukaschuk on 14.01.2022.
//

import Foundation


class NetworkManager {
    
    static let shared = NetworkManager()
    
    let sessionConfiguration = URLSessionConfiguration.default
    let session = URLSession.shared
    
    func postRequest() {
        
        guard let url = URL(string: "https://8ball.delegator.com/magic/JSON/question_string") else { fatalError() }
        
        session.dataTask(with: url) { (data, response, error) in
            
        }.resume()
    }
}




