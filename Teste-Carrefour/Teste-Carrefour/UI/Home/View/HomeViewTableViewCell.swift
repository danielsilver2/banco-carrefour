//
//  HomeViewTableViewCell.swift
//  Teste-Carrefour
//
//  Created by Daniel Rodrigues da Silveira on 13/05/23.
//

import Foundation
import Kingfisher
import UIKit

class HomeViewTableViewCell: UITableViewCell {

    private struct ViewMetrics {
        static let avatarCornerRadius: CGFloat = 24
        static let avatarImageViewSizeUnit: CGFloat = 48
        static let nameLabelSystemFont = UIFont.systemFont(ofSize: 20)
        static let buttonImageString = "chevron.right"
    }

    static let id = "HomeViewTableViewCell"
    
    private lazy var avatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .systemGray
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = ViewMetrics.avatarCornerRadius
        return imageView
    }()

    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = ViewMetrics.nameLabelSystemFont
        return label
    }()

    private lazy var buttonImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: ViewMetrics.buttonImageString)
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
        addSubview(avatarImageView)
        addSubview(nameLabel)
        addSubview(buttonImageView)
    }
    
    private func addConstraints() {
        avatarImageView.snp.makeConstraints {
            $0.top.bottom.equalToSuperview().inset(Metrics.xxsmall)
            $0.height.width.equalTo(ViewMetrics.avatarImageViewSizeUnit)
            $0.left.equalToSuperview()
        }

        nameLabel.snp.makeConstraints {
            $0.centerY.equalTo(avatarImageView.snp.centerY)
            $0.left.equalTo(avatarImageView.snp.right).offset(Metrics.xxsmall)
        }
        
        buttonImageView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.left.greaterThanOrEqualTo(nameLabel.snp.right)
            $0.right.equalToSuperview().inset(Metrics.huge)
            $0.height.equalTo(Metrics.large)
            $0.width.equalTo(Metrics.medium)
        }
    }

    public func updateView(with entity: UserViewEntity) {
        nameLabel.text = entity.name
        avatarImageView.kf.setImage(with: entity.avatarUrl)
    }
}
