//
//  HomeViewController.swift
//  Teste-Carrefour
//
//  Created by Daniel Rodrigues da Silveira on 12/05/23.
//

import Foundation
import UIKit

class HomeViewController: UIViewController {
    weak var delegate: UserCoordinatorDelegate?
    
    private var viewState: HomeViewState = .loading {
        didSet {
            contentView.updateView(with: viewState)
        }
    }

    public let contentView = HomeView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = contentView
    }
}
