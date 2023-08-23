//
//  CustomAlertView.swift
//  POP Alert
//
//  Created by Matheus Sanada on 23/08/23.
//

import UIKit

internal class CustomAlertView: UIView {
    internal var title: String
    internal var message: String
    internal var button: AlertButton
    internal var image: UIImage
    var delegate: CustomAlertProtocol?
    
    internal init(title: String,
                  message: String,
                  button: AlertButton,
                  image: UIImage) {
        self.title = title
        self.message = message
        self.button = button
        self.image = image
        super.init(frame: .zero)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var stack: UIStackView = {
        let stack = UIStackView()
        stack.distribution = .fill
        stack.alignment = .fill
        stack.spacing = 10
        stack.axis = .vertical
        stack.isUserInteractionEnabled = true
        return stack
    }()
    
    private lazy var imageView: UIImageView = {
        let image = UIImageView(image: self.image)
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    private lazy var labelTitle: UILabel = {
        let labelTitle = UILabel()
        labelTitle.textColor = .label
        labelTitle.text = title
        labelTitle.textAlignment = .center
        labelTitle.font = .boldSystemFont(ofSize: 24)
        labelTitle.numberOfLines = 0
        return labelTitle
    }()
    
    private lazy var labelMessage: UILabel = {
        let labelMessage = UILabel()
        labelMessage.textColor = .secondaryLabel
        labelMessage.text = message
        labelMessage.textAlignment = .center
        labelMessage.font = .systemFont(ofSize: 17)
        labelMessage.numberOfLines = 0
        return labelMessage
    }()
    
    internal lazy var buttonAction: UIButton = {
        let buttonAction = UIButton(frame: .zero)
        buttonAction.backgroundColor = button.color()
        buttonAction.isUserInteractionEnabled = true
        switch button {
        case .`default`(let title):
            buttonAction.setTitle(title, for: .normal)
        case .destructive(let title):
            buttonAction.setTitle(title, for: .normal)
        case .cancel(let title):
            buttonAction.setTitle(title, for: .normal)
        }
        buttonAction.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        return buttonAction
    }()

    func configureUI() {
        isUserInteractionEnabled = true
        let containerView = UIView()
        containerView.backgroundColor = .secondarySystemBackground
        containerView.layer.cornerRadius = 20
        containerView.layer.masksToBounds = true
        
        self.addSubview(containerView)
        
        containerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            containerView.centerXAnchor.constraint(equalTo: centerXAnchor),
            containerView.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
        
        configureStack(in: containerView)
    }
    
    private func configureStack(in containerView: UIView) {
        containerView.addSubview(stack)
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stack.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 20),
            stack.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
            stack.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20),
            stack.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -20)
        ])
        
        stack.addArrangedSubview(labelTitle)
        stack.addArrangedSubview(imageView)
        stack.addArrangedSubview(labelMessage)
        stack.addArrangedSubview(buttonAction)
        
        NSLayoutConstraint.activate([
            imageView.widthAnchor.constraint(equalToConstant: 200),
            imageView.heightAnchor.constraint(equalToConstant: 150),
            buttonAction.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        buttonAction.layoutIfNeeded()
        stack.layoutIfNeeded()
    }
    
    @objc func buttonTapped() {
        delegate?.didTap()
    }
}
