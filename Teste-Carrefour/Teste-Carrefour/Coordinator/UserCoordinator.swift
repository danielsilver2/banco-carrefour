//
//  UserCoordinator.swift
//  Teste-Carrefour
//
//  Created by Daniel Rodrigues da Silveira on 12/05/23.
//

import Foundation
import UIKit

protocol UserCoordinatorDelegate: AnyObject {
    func showUserRepo()
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
        navigationController.setViewControllers([vc], animated: false)
    }
}

// MARK: ViewControllers Factory
extension UserCoordinator {
    func makeHomeViewController() -> HomeViewController {
        let vc = HomeViewController()
        vc.delegate = self
        return vc
    }
}

extension UserCoordinator: UserCoordinatorDelegate {
    func showUserRepo() {
        print("show user repo screen")
    }
}
