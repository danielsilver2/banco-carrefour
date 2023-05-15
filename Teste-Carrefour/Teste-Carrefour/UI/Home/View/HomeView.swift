//
//  HomeView.swift
//  Teste-Carrefour
//
//  Created by Daniel Rodrigues da Silveira on 13/05/23.
//

import Foundation
import UIKit
import SnapKit

protocol HomeViewDelegate: AnyObject {
    func didTapUserCell(with name: String)
}

//protocol HomeViewProtocol: AnyObject {
//    var viewState: HomeViewState
//}

public class HomeView: UIView {

    weak var delegate: HomeViewDelegate?
    
    private var contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()

    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(HomeViewTableViewCell.self, forCellReuseIdentifier: HomeViewTableViewCell.id)
        tableView.allowsSelection = false
        return tableView
    }()

    private var viewEntity: HomeViewEntity?

    override init(frame: CGRect) {
        super.init(frame: frame)

        addViewHierarchy()
        addConstraints()
    }

    
//    init() {
//        super.init(frame: .zero)
//        addViewHierarchy()
//        addConstraints()
//    }
//
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func updateView(with entity: HomeViewEntity) {
        viewEntity = entity

        DispatchQueue.main.async { [weak self] in
            self?.tableView.reloadData()
        }
    }

    private func addViewHierarchy() {
        addSubview(contentView)
        contentView.addSubview(tableView)
    }

    private func addConstraints() {
        contentView.snp.makeConstraints {
            $0.top.left.bottom.right.equalToSuperview()
        }
        
        tableView.snp.makeConstraints {
            $0.top.equalTo(contentView.snp.top).offset(20)
            $0.left.right.equalToSuperview().offset(24)
            $0.bottom.equalToSuperview()
        }
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
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewEntity?.users.count ?? 0
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: HomeViewTableViewCell.id, for: indexPath)
        
        if let homeCell = cell as? HomeViewTableViewCell, let viewEntity {
            homeCell.updateView(with: viewEntity.users[indexPath.row])
        }
        return cell
    }

    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let viewEntity else { return }
        let name = viewEntity.users[indexPath.row].name
        delegate?.didTapUserCell(with: name)
    }
}
