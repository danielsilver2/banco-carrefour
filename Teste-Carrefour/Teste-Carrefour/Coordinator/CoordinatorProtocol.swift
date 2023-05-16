//
//  CoordinatorProtocol.swift
//  Teste-Carrefour
//
//  Created by Daniel Rodrigues da Silveira on 15/05/23.
//

import Foundation
import UIKit

protocol Coordinator {
    var parentCoordinator: Coordinator? { get set }
    var children: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }
    
    func start()
}
