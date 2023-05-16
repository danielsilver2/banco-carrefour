//
//  UserFollowersView.swift
//  Teste-Carrefour
//
//  Created by Daniel Rodrigues da Silveira on 15/05/23.
//

import Foundation
import UIKit

public enum UserFollowerViewType: String {
    case following = "FOLLOWING"
    case follower = "FOLLOWERS"
}

public struct UserFollowersViewEntity {
    public let type: UserFollowerViewType
    public let number: Int
}

public class UserFollowersView: UIView {
    
    private lazy var contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    private lazy var numberLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: 18)
        return label
    }()

    private lazy var textLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .gray
        label.font = .boldSystemFont(ofSize: 14)
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)

        addViewHierarchy()
        addConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func updateView(with entity: UserFollowersViewEntity) {
        textLabel.text = entity.type.rawValue
        numberLabel.text = entity.number.description
    }

    private func addViewHierarchy() {
        addSubview(contentView)
        contentView.addSubview(textLabel)
        contentView.addSubview(numberLabel)
    }

    private func addConstraints() {
        contentView.snp.makeConstraints {
            $0.top.left.bottom.right.equalToSuperview()
        }

        textLabel.snp.makeConstraints {
            $0.top.centerX.equalToSuperview()
        }
        
        numberLabel.snp.makeConstraints {
            $0.top.equalTo(textLabel.snp.bottom).offset(Metrics.large)
            $0.bottom.centerX.equalToSuperview()
        }
    }
}
