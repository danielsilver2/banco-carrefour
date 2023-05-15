//
//  HomeViewEntityFactory.swift
//  Teste-Carrefour
//
//  Created by Daniel Rodrigues da Silveira on 14/05/23.
//

import Foundation

class HomeViewEntityFactory {

    let response: UsersUseCaseResponse!

    init(data: UsersUseCaseResponse) {
        self.response = data
    }

    public func make() -> HomeViewEntity {
        .init(users: response.map { makeUserEntity(with: $0) })
    }

    private func makeUserEntity(with data: UserUseCaseResponse) -> UserEntity {
        return .init(
            name: data.login
        )
    }
}
