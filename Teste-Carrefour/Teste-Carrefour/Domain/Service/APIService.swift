//
//  APIService.swift
//  Teste-Carrefour
//
//  Created by Daniel Rodrigues da Silveira on 13/05/23.
//

import Foundation

class APIService: NSObject {

    private let baseUrlString = "https://api.github.com/"
    
    private let usersPath = "users"
    
    func apiToGetUsersData(completion: @escaping (UsersUseCaseResponse) -> Void){
        if let url = URL(string: baseUrlString + usersPath) {
            URLSession.shared.dataTask(with: url) { (data, urlResponse, error) in
                if let data {
                    let usersData = try! JSONDecoder().decode(UsersUseCaseResponse.self, from: data)
                    completion(usersData)
                }
            }.resume()
        }
    }

    func apiToGetUserData(with id: String, completion: @escaping (UserUseCaseResponse) -> Void){
        if let url = URL(string: baseUrlString + usersPath + "/\(id)") {
            URLSession.shared.dataTask(with: url) { (data, urlResponse, error) in
                if let data {
                    let userData = try! JSONDecoder().decode(UserUseCaseResponse.self, from: data)
                    completion(userData)
                }
            }.resume()
        }
    }
}
