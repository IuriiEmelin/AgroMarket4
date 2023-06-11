//
//  CategoryNameView.swift
//  AgroMarket
//
//  Created by Даниил Чупин on 10.06.2023.
//

import UIKit

final class CategoryNameView: UIView {
    
    static func create(icon: UIImage, title: String) -> CategoryNameView {
        let categoryView = CategoryNameView()
        categoryView.iconView.image = icon
        categoryView.label.text = title
        
        return categoryView
    }

    private let iconView = UIImageView()
    private let label = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    private func setup() {
        addSubview(iconView)
        addSubview(label)
        
        iconView.translatesAutoresizingMaskIntoConstraints = false
        label.translatesAutoresizingMaskIntoConstraints = false
        
        let iconWidth: CGFloat = 20.0
        
        NSLayoutConstraint.activate([
            iconView.widthAnchor.constraint(equalToConstant: iconWidth),
            iconView.heightAnchor.constraint(equalToConstant: iconWidth),
            iconView.leadingAnchor.constraint(equalTo: leadingAnchor,
                                              constant: 0.0),
            iconView.centerYAnchor.constraint(equalTo: centerYAnchor),
            label.trailingAnchor.constraint(equalTo: trailingAnchor),
            label.centerYAnchor.constraint(equalTo: centerYAnchor),
            label.leadingAnchor.constraint(equalTo: iconView.trailingAnchor,
                                              constant: 10.0),
        ])
        
        label.font = UIFont.systemFont(ofSize: 16)
        label.textAlignment = .left
        
        iconView.contentMode = .scaleAspectFit
    }

}
