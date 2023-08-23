//
//  AlertButton.swift
//  POP Alert
//
//  Created by Matheus Sanada on 23/08/23.
//

import UIKit

public enum AlertButton: ButtonType {
    case `default`(title: String)
    case destructive(title: String)
    case cancel(title: String)
}

extension AlertButton {
    public func action(handler: ((UIAlertAction) -> Void)?) -> UIAlertAction {
        switch self {
        case .`default`(let title):
            return UIAlertAction(title: title, style: .default, handler: handler)
        case .destructive(let title):
            return UIAlertAction(title: title, style: .destructive, handler: handler)
        case .cancel(let title):
            return UIAlertAction(title: title, style: .cancel, handler: handler)
        }
    }
    
    func color() -> UIColor {
        switch self {
        case .`default`:
            return .tintColor
        case .destructive:
            return .systemRed
        case .cancel:
            return .systemGroupedBackground
        }
    }
    
    func action() -> UIAlertAction.Style {
        switch self {
        case .`default`:
            return .default
        case .destructive:
            return .destructive
        case .cancel:
            return .cancel
        }
    }
}
