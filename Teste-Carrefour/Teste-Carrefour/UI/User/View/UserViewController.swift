//
//  UserViewController.swift
//  Teste-Carrefour
//
//  Created by Daniel Rodrigues da Silveira on 15/05/23.
//

import Foundation
import UIKit

class UserViewController: UIViewController, UserViewModelDelegate {
    
    private let contentView = UserView(frame: UIScreen.main.bounds)
    public var viewState: UserViewState = .loading {
        didSet {
            contentView.updateView(with: viewState)
        }
    }
    private var viewModel: UserViewModel
    public weak var delegate: MainCoordinatorDelegate?

    init(viewModel: UserViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        viewModel.delegate = self
        setupView()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupView() {
        view = contentView
    }

    public func didChange(viewState: UserViewState) {
        self.viewState = viewState
    }
}
