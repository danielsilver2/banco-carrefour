//
//  HomeViewModel.swift
//  Teste-Carrefour
//
//  Created by Daniel Rodrigues da Silveira on 13/05/23.
//

import Foundation

enum HomeViewState {
    case hasData(HomeViewEntity)
    case hasError
    case loading
}

public class HomeViewModel {
    
    init() {
        viewController = HomeViewController()
    }

    private var viewController: HomeViewController

    func initState() {
        
    }
}
