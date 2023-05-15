//
//  UserCoordinator.swift
//  Teste-Carrefour
//
//  Created by Daniel Rodrigues da Silveira on 12/05/23.
//

import Foundation
import UIKit

protocol UserCoordinatorDelegate: AnyObject {
    func showUserInfo(from name: String)
}

class UserCoordinator: Coordinator {
    var parentCoordinator: Coordinator?
    var children: [Coordinator] = []
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let vc = makeHomeViewController()
        navigationController.pushViewController(vc, animated: false)
//        navigationController.setViewControllers([vc], animated: false)
    }
}

// MARK: ViewControllers Factory
extension UserCoordinator {
    func makeHomeViewController() -> HomeViewController {
        let viewModel = HomeViewModel()
        let vc = HomeViewController(viewModel: viewModel)
        vc.delegate = self
        return vc
    }

    func makeUserViewController() -> UserViewController {
        let viewModel = UserViewModel()
        let vc = UserViewController(viewModel: viewModel)
        vc.delegate = self
        return vc
    }
}

extension UserCoordinator: UserCoordinatorDelegate {
    func showUserInfo(from name: String) {
        print("show user repo screen")
    }
}
