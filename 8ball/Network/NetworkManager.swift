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
    let decoder = JSONDecoder()
    
    func postRequest() {
        
        guard let url = URL(string: "https://8ball.delegator.com/magic/JSON/question_string") else { fatalError() }
        
        session.dataTask(with: url) { [weak self] (data, response, error) in
            guard let strongSelf = self else { fatalError() }
            
            guard error == nil, let data = data else {
                print(error?.localizedDescription ?? "error")
                fatalError()
            }
            
            let answers = try? strongSelf.decoder.decode(Welcome.self, from: data)
            
            if let answer = answers?.magic.answer {
                Answers.serverData.append(answer)
            }
            
        }.resume()
    }
}




