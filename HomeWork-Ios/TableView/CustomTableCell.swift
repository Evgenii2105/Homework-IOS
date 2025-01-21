//
//  CustomTableCell.swift
//  HomeWork-Ios
//
//  Created by Евгений Фомичев on 11.01.2025.
//

import UIKit

class CustomTableCell: UITableViewCell {
    
    private let statusButton: UIButton = {
        let statusButton = UIButton()
        statusButton.setTitle("", for: .normal)
        statusButton.tintColor = .label
        statusButton.translatesAutoresizingMaskIntoConstraints = false
        return statusButton
    }()
    
    private let titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.numberOfLines = 0
        titleLabel.font = .preferredFont(forTextStyle: .footnote)
        titleLabel.adjustsFontSizeToFitWidth = false
        titleLabel.lineBreakMode = .byWordWrapping
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        return titleLabel
    }()
    
    private let subTitleLabel: UILabel = {
        let subtitle = UILabel()
        subtitle.numberOfLines = 0
        subtitle.adjustsFontSizeToFitWidth = false
        subtitle.lineBreakMode = .byWordWrapping
        subtitle.translatesAutoresizingMaskIntoConstraints = false
        return subtitle
    }()
    
    private let container: UIView = {
        let container = UIView()
        container.translatesAutoresizingMaskIntoConstraints = false
        container.backgroundColor = .systemBackground
        return container
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(container)
        container.addSubview(titleLabel)
        container.addSubview(subTitleLabel)
        contentView.addSubview(statusButton)
        
        setupConstraints()
        
        statusButton.addTarget(self, action: #selector(changeStateDone), for: .touchDown)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // обработка нажатия на кнопку выполнения
    @objc
    private func changeStateDone(_ sender: UIButton) {
        print("кнопка нажата")
        
        if statusButton.image(for: .normal) == .circlebadge {
            statusButton.setImage(.circlebadgeFill, for: .normal)
        } else {
            statusButton.setImage(.circlebadge, for: .normal)
        }
    }
    
    private func addImage(with: TodoItem) {
        if let image = UIImage(systemName: with.image) {
            statusButton.setImage(image, for: .normal)
        }
    }
    
    func configure(with todo: TodoItem) {
        titleLabel.text = todo.title
        subTitleLabel.text = todo.subTitle
        titleLabel.font = .systemFont(ofSize: 22)
        
        let imageName = todo.status ? "circlebadge.fill" : "circlebadge"
        statusButton.setImage(UIImage(systemName: imageName), for: .normal)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            
            container.centerYAnchor.constraint(equalTo: statusButton.centerYAnchor),
            container.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            container.trailingAnchor.constraint(equalTo: statusButton.leadingAnchor, constant: -8),
            
            // Setting title
            titleLabel.topAnchor.constraint(equalTo: container.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: container.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: container.trailingAnchor),
            
            // Setting subTitle
            subTitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4),
            subTitleLabel.leadingAnchor.constraint(equalTo: container.leadingAnchor),
            subTitleLabel.trailingAnchor.constraint(equalTo: container.trailingAnchor),
            subTitleLabel.bottomAnchor.constraint(equalTo: container.bottomAnchor),
            
            // Setting button
            statusButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            statusButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            statusButton.widthAnchor.constraint(equalToConstant: 40),
            statusButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
}
