//
//  UserViewEntityFactory.swift
//  Teste-Carrefour
//
//  Created by Daniel Rodrigues da Silveira on 15/05/23.
//

import Foundation

class UserViewEntityFactory {

    let response: UserUseCaseResponse!

    init(data: UserUseCaseResponse) {
        self.response = data
    }

    public func make() -> UserViewEntity {
        makeUserEntity(with: response)
    }

    private func makeUserEntity(with data: UserUseCaseResponse) -> UserViewEntity {
        return .init(
            name: data.login,
            avatarUrl: URL(string: data.avatarURL),
            followerNumber: data.followers,
            followingNumber: data.following
        )
    }
}
