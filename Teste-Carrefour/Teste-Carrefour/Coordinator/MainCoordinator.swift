//
//  MainCoordinator.swift
//  Teste-Carrefour
//
//  Created by Daniel Rodrigues da Silveira on 12/05/23.
//

import Foundation
import UIKit

protocol MainCoordinatorDelegate: AnyObject {
    func showUserInfo(from name: String)
}

class MainCoordinator: Coordinator {
    var parentCoordinator: Coordinator?
    var children: [Coordinator] = []
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = makeHomeViewController()
        navigationController.pushViewController(vc, animated: false)
    }
}

// MARK: ViewControllers Factory
extension MainCoordinator {
    func makeHomeViewController() -> HomeViewController {
        let viewModel = HomeViewModel()
        let vc = HomeViewController(viewModel: viewModel)
        vc.delegate = self
        return vc
    }

    func makeUserViewController(with userId: String) -> UserViewController {
        let viewModel = UserViewModel(userId: userId)
        let vc = UserViewController(viewModel: viewModel)
        vc.delegate = self
        return vc
    }
}

extension MainCoordinator: MainCoordinatorDelegate {
    func showUserInfo(from name: String) {
        let vc = makeUserViewController(with: name)
        navigationController.pushViewController(vc, animated: false)
    }
}

