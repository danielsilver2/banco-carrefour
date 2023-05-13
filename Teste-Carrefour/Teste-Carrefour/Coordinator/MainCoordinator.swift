//
//  MainCoordinator.swift
//  Teste-Carrefour
//
//  Created by Daniel Rodrigues da Silveira on 12/05/23.
//

import Foundation
import UIKit

protocol Coordinator {
    var parentCoordinator: Coordinator? { get set }
    var children: [Coordinator] { get set }
    var navigationController : UINavigationController { get set }
    
    func start()
}

class MainCoordinator: Coordinator {
    var parentCoordinator: Coordinator?
    var children: [Coordinator] = []
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let userCoordinator = UserCoordinator(navigationController: navigationController)
        userCoordinator.parentCoordinator = self
        userCoordinator.start()
    }
}
