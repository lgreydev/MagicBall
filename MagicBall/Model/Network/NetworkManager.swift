//
//  NetworkManager.swift
//  8ball
//
//  Created by Sergey Lukaschuk on 14.01.2022.
//

import Foundation

class NetworkManager {

    private let sessionConfiguration = URLSessionConfiguration.default
    private let session = URLSession.shared
    private let decoder = JSONDecoder()
    
    func postRequest(completion: @escaping (ObtainResult) -> Void ) {
        
        guard let url = URL(string: "https://8ball.delegator.com/magic/JSON/question_string") else { fatalError() }
        
        session.dataTask(with: url) { [weak self] (data, response, error) in
            
            var result: ObtainResult
            
            defer {
                DispatchQueue.main.async {
                    completion(result)
                }
            }
            
            guard let strongSelf = self else { result = .failure(true); return }
            guard error == nil, let data = data else {
                result = .failure(true)
                return
            }
            
            let answers = try? strongSelf.decoder.decode(MagicBallAPI.self, from: data)
            if let answer = answers?.magic.answer {
                result = .success(answer)
            } else {
                result = .failure(true)
            }
        }.resume()
    }
}

enum ObtainResult {
    case success(String)
    case failure(Bool)
}
