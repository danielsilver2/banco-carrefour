//
//  HomeView.swift
//  Teste-Carrefour
//
//  Created by Daniel Rodrigues da Silveira on 13/05/23.
//

import Foundation
import UIKit

protocol HomeViewDelegate: AnyObject {
    func didTapUserCell()
}

//protocol HomeViewProtocol: AnyObject {
//    var viewState: HomeViewState
//}

class HomeView: UIView {

    weak var delegate: HomeViewDelegate?

    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(HomeViewTableViewCell.self, forCellReuseIdentifier: HomeViewTableViewCell.id)
        return tableView
    }()
    
    init() {
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func updateView(with entity: HomeViewEntity) {
        
    }
}

extension HomeView {
    func updateView(with state: HomeViewState) {
        switch state {
        case .hasData(let entity):
            updateView(with: entity)
        case .hasError:
            print("error")
        case .loading:
            print("loading")
        }
    }
}

extension HomeView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: HomeViewTableViewCell.id, for: indexPath)
        
        if let homeCell = cell as? HomeViewTableViewCell {
            print("homeCell")
        }
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.didTapUserCell()
    }
}
