//
//  AlertSheet.swift
//  POP Alert
//
//  Created by Matheus Sanada on 23/08/23.
//

import UIKit

public struct AlertSheet: AlertType {
    public var title: String
    public var message: String
    public var buttons: [AlertButton]
    public var delegate: AlertControllerDelegate
    
    public init(title: String,
                message: String,
                buttons: AlertButton...,
                delegate: AlertControllerDelegate) {
        self.title = title
        self.message = message
        self.buttons = buttons
        self.delegate = delegate
    }

    public func show() {
        
        let actionSheetController = UIAlertController(title: title,
                                                      message: message,
                                                      preferredStyle: .actionSheet)
        for button in buttons {
            actionSheetController.addAction(button.action(handler: delegate.didSelect(_:)))
        }
        
        delegate.present(actionSheetController,
                         animated: true,
                         completion: nil)
    }
    
}

