//
//  HomeViewEntity.swift
//  Teste-Carrefour
//
//  Created by Daniel Rodrigues da Silveira on 13/05/23.
//

import Foundation

struct HomeViewEntity {
    public let users: [UserEntity]
}

struct UserEntity {
    public let name: String
    public let id: String
}
