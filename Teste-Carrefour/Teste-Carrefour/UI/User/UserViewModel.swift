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
    func didChange(viewState: HomeViewState)
}

public class UserViewModel {
    
    public weak var delegate: UserViewModelDelegate?
    
    init() {
        apiService = APIService()
        getUsers()
    }
    
    private var apiService: APIService?
    
    private func getUsers() {
        apiService?.apiToGetUserData { [weak self] in
            let entity = HomeViewEntityFactory(data: $0).make()
            self?.delegate?.didChange(viewState: .hasData(entity))
        }
    }
}
