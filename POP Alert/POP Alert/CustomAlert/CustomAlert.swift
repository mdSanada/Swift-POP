//
//  CustomAlert.swift
//  POP Alert
//
//  Created by Matheus Sanada on 23/08/23.
//

import UIKit

public class CustomAlert: AlertType, CustomAlertProtocol {
    public var title: String
    public var message: String
    public var image: UIImage
    internal var button: AlertButton
    public var delegate: AlertControllerDelegate
    private var controller: CustomAlertController?

    public init(title: String,
                message: String,
                image: UIImage,
                button: AlertButton,
                delegate: AlertControllerDelegate) {
        self.title = title
        self.message = message
        self.image = image
        self.button = button
        self.delegate = delegate
    }
 
    private func constructView() -> CustomAlertController {
        let alert = CustomAlertView(title: title,
                                    message: message,
                                    button: button,
                                    image: image)
        alert.delegate = self
        
        let controller = CustomAlertController(alert: alert)
        
        self.controller = controller

        return controller
    }
    
    public func show() {
        let alert = constructView()
        alert.modalPresentationStyle = .overFullScreen
        alert.modalTransitionStyle = .coverVertical
        delegate.navigationController?.present(alert, animated: true)
    }
        
    func didTap() {
        guard let controller = controller else { return }
        
        controller.dismiss(animated: true)
        delegate.didSelect(UIAlertAction(title: title, style: button.action()))
    }
}
