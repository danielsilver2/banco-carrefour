//
//  LoadingView.swift
//  Teste-Carrefour
//
//  Created by Daniel Rodrigues da Silveira on 15/05/23.
//

import Foundation
import UIKit

public class LoadingView: UIView {
        
    private lazy var contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    private lazy var loadingView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var loadingIndicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView()
        indicator.translatesAutoresizingMaskIntoConstraints = false
        return indicator
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
        contentView.addSubview(loadingView)
        loadingView.addSubview(loadingIndicator)
    }

    private func addConstraints() {
        contentView.snp.makeConstraints {
            $0.top.left.bottom.right.equalToSuperview()
        }

        loadingView.snp.makeConstraints {
            $0.width.height.equalTo(120)
            $0.center.equalToSuperview()
        }

        loadingIndicator.snp.makeConstraints {
            $0.top.left.bottom.right.equalToSuperview()
        }
    }
}
