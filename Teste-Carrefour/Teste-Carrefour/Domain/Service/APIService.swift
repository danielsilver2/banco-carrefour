//
//  APIService.swift
//  Teste-Carrefour
//
//  Created by Daniel Rodrigues da Silveira on 13/05/23.
//

import Foundation

class APIService:  NSObject {
    
    private let sourcesURL = URL(string: "https://api.github.com/users")!
    
    func apiToGetUsersData(completion: @escaping ([GetUserUseCaseResponse]) -> Void){
        URLSession.shared.dataTask(with: sourcesURL) { (data, urlResponse, error) in
            if let data = data {
                
                let jsonDecoder = JSONDecoder()
                
                let empData = try! jsonDecoder.decode([GetUserUseCaseResponse].self, from: data)
                    completion(empData)
            }
        }.resume()
    }
}
