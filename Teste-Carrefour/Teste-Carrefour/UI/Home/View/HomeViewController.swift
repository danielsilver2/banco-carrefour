//
//  HomeViewController.swift
//  Teste-Carrefour
//
//  Created by Daniel Rodrigues da Silveira on 12/05/23.
//

import Foundation
import UIKit

public protocol HomeViewControllerViewDelegate: AnyObject {
    var viewState: HomeViewState { get set }
}

class HomeViewController: UIViewController, HomeViewModelDelegate {
    
    private var viewModel: HomeViewModel?
    public let contentView = HomeView(frame: UIScreen.main.bounds)
    public var viewState: HomeViewState = .loading {
        didSet {
            contentView.updateView(with: viewState)
        }
    }

    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        viewModel.delegate = self
        setupView()
    }

    private func setupView() {
        view = contentView
        contentView.delegate = self
        navigationItem.titleView = searchBar
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    weak var delegate: UserCoordinatorDelegate?
    
    private lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.searchBarStyle = UISearchBar.Style.default
        searchBar.placeholder = " Procurar por usuário..."
        searchBar.sizeToFit()
        searchBar.isTranslucent = false
        searchBar.backgroundImage = UIImage()
        searchBar.delegate = self
        searchBar.showsCancelButton = true
        searchBar.largeContentTitle = "Usuários"
        return searchBar
    }()

    
    public func didChange(viewState: HomeViewState) {
        self.viewState = viewState
    }
}

extension HomeViewController: UISearchBarDelegate {
    public func searchBar(_ searchBar: UISearchBar, textDidChange textSearched: String) {
       print("search")
    }
}

extension HomeViewController: HomeViewDelegate {
    func didTapUserCell(with name: String) {
        delegate?.showUserInfo(from: name)
    }
}
