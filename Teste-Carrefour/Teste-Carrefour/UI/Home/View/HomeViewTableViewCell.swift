//
//  HomeViewTableViewCell.swift
//  Teste-Carrefour
//
//  Created by Daniel Rodrigues da Silveira on 13/05/23.
//

import Foundation
import UIKit

class HomeViewTableViewCell: UITableViewCell {
    static let id = "HomeViewTableViewCell"
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var buttonImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "chevron.right")
        imageView.tintColor = .systemGray
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addViewHierarchy()
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addViewHierarchy() {
        addSubview(nameLabel)
        addSubview(buttonImageView)
    }
    
    private func addConstraints() {
        nameLabel.snp.makeConstraints {
            $0.top.bottom.equalToSuperview().inset(12)
            $0.left.equalToSuperview()
        }
        
        buttonImageView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.left.greaterThanOrEqualTo(nameLabel.snp.right)
            $0.right.equalToSuperview().inset(48)
            $0.height.equalTo(24)
            $0.width.equalTo(16)
        }
    }

    public func updateView(with entity: UserEntity) {
        nameLabel.text = entity.name
    }
}
