//
//  UserView.swift
//  Teste-Carrefour
//
//  Created by Daniel Rodrigues da Silveira on 15/05/23.
//

import Foundation
import UIKit
import SnapKit

public class UserView: UIView {

    private struct ViewMetrics {
        static let avatarImageName = "camera"
        static let avatarCornerRadius: CGFloat = 60
        static let nameLabelFontSize: CGFloat = 22
        static let followersSizeWidth = 120
    }

    private lazy var contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isHidden = true
        view.backgroundColor = .white
        return view
    }()
    
    private lazy var avatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        imageView.backgroundColor = .systemGray
        imageView.image = .init(systemName: ViewMetrics.avatarImageName)
        imageView.layer.cornerRadius = ViewMetrics.avatarCornerRadius
        return imageView
    }()

    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: ViewMetrics.nameLabelFontSize)
        return label
    }()

    private lazy var separatorView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .gray
        return view
    }()

    private lazy var followersView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isHidden = false
        return view
    }()

    private lazy var userFollowersView: UserFollowersView = {
        let view = UserFollowersView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var followersSeparatorView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemGray
        return view
    }()

    private lazy var userFollowingView: UserFollowersView = {
        let view = UserFollowersView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var loadingView: LoadingView = {
        let loadingView = LoadingView()
        loadingView.translatesAutoresizingMaskIntoConstraints = false
        return loadingView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)

        addViewHierarchy()
        addConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func addViewHierarchy() {
        addSubview(contentView)
        addSubview(loadingView)

        contentView.addSubview(avatarImageView)
        contentView.addSubview(nameLabel)
        contentView.addSubview(separatorView)

        contentView.addSubview(followersView)
        followersView.addSubview(userFollowersView)
        followersView.addSubview(followersSeparatorView)
        followersView.addSubview(userFollowingView)
    }

    private func addConstraints() {
        contentView.snp.makeConstraints {
            $0.top.left.bottom.right.equalToSuperview()
        }
        
        loadingView.snp.makeConstraints {
            $0.top.left.bottom.right.equalToSuperview()
        }

        avatarImageView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(120)
            $0.width.height.equalTo(120)
            $0.centerX.equalToSuperview()
        }

        nameLabel.snp.makeConstraints {
            $0.top.equalTo(avatarImageView.snp.bottom).offset(Metrics.large)
            $0.centerX.equalToSuperview()
        }

        addFollowersViewConstraints()
    }

    private func addFollowersViewConstraints() {
        followersView.snp.makeConstraints {
            $0.top.equalTo(nameLabel.snp.bottom).offset(Metrics.large)
            $0.centerX.equalToSuperview()
        }

        userFollowersView.snp.makeConstraints {
            $0.top.left.bottom.equalToSuperview()
            $0.width.equalTo(ViewMetrics.followersSizeWidth)
        }

        followersSeparatorView.snp.makeConstraints {
            $0.left.equalTo(userFollowersView.snp.right)
            $0.top.bottom.equalToSuperview()
            $0.width.equalTo(1)
        }
        
        userFollowingView.snp.makeConstraints {
            $0.left.equalTo(followersSeparatorView.snp.right)
            $0.width.equalTo(ViewMetrics.followersSizeWidth)
            $0.top.right.bottom.equalToSuperview()
        }
    }

    public func updateView(with entity: UserViewEntity) {
        DispatchQueue.main.async { [weak self] in
            self?.avatarImageView.kf.setImage(with: entity.avatarUrl)
            self?.nameLabel.text = entity.name
            self?.updateFollowerView(with: entity)
        }
    }

    private func updateFollowerView(with entity: UserViewEntity) {
        guard let followers = entity.followerNumber,
              let following = entity.followingNumber else {
            return
        }

        followersView.isHidden = false

        userFollowersView.updateView(with: .init(
            type: .follower,
            number: followers
        ))

        userFollowingView.updateView(with: .init(
            type: .following,
            number: following
        ))
    }

    private func setLoading(_ bool: Bool) {
        DispatchQueue.main.async { [weak self] in
            self?.loadingView.isHidden = !bool
            self?.contentView.isHidden = bool
        }
    }
}

extension UserView {
    func updateView(with state: UserViewState) {
        switch state {
        case .hasData(let entity):
            setLoading(false)
            updateView(with: entity)
        case .hasError:
            print("error")
        case .loading:
            setLoading(true)
        }
    }
}
