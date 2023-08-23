//
//  CustomAlertController.swift
//  POP Alert
//
//  Created by Matheus Sanada on 23/08/23.
//

import UIKit

internal class CustomAlertController: UIViewController {
    let alert: CustomAlertView
    
    init(alert: CustomAlertView) {
        self.alert = alert
        super.init(nibName: nil, bundle: nil)
        self.alert.isUserInteractionEnabled = true
        self.view.isUserInteractionEnabled = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(self.alert)
        self.alert.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.alert.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.alert.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            self.alert.widthAnchor.constraint(equalTo: self.view.widthAnchor),
            self.alert.heightAnchor.constraint(equalTo: self.view.heightAnchor)
        ])

        self.alert.layoutIfNeeded()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        UIView.animate(withDuration: 0.2, delay: 0) { [weak self] in
            self?.view.backgroundColor = .secondarySystemBackground.withAlphaComponent(0.4)
        }
    }
}
