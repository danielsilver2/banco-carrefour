//
//  HomeViewModel.swift
//  Teste-Carrefour
//
//  Created by Daniel Rodrigues da Silveira on 13/05/23.
//

import Foundation

public enum HomeViewState {
    case hasData(HomeViewEntity)
    case hasError
    case loading
}

public protocol HomeViewModelDelegate: AnyObject {
    func didChange(viewState: HomeViewState)
}

public class HomeViewModel {
    
    public weak var delegate: HomeViewModelDelegate?
    
    init() {
        apiService = APIService()
        getUsers()
    }
    
    private var apiService: APIService?
    
    private func getUsers() {
        apiService?.apiToGetUsersData { [weak self] in
            let entity = HomeViewEntityFactory(data: $0).make()
            self?.delegate?.didChange(viewState: .hasData(entity))
        }
    }
}
