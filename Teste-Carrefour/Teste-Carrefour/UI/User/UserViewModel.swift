//
//  UserViewModel.swift
//  Teste-Carrefour
//
//  Created by Daniel Rodrigues da Silveira on 15/05/23.
//

import Foundation

public enum UserViewState {
    case hasData(UserViewEntity)
    case hasError
    case loading
}

public protocol UserViewModelDelegate: AnyObject {
    func didChange(viewState: UserViewState)
}

public class UserViewModel {
    
    public weak var delegate: UserViewModelDelegate?
    
    init(userId: String) {
        apiService = APIService()
        getUser(with: userId)
    }
    
    private var apiService: APIService?
    
    private func getUser(with userId: String) {
        apiService?.apiToGetUserData(with: userId) { [weak self] in
            let entity = UserViewEntityFactory(data: $0).make()
            self?.delegate?.didChange(viewState: .hasData(entity))
        }
    }
}
