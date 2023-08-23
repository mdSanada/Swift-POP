//
//  AlertType.swift
//  POP Alert
//
//  Created by Matheus Sanada on 23/08/23.
//

import UIKit

public protocol AlertControllerDelegate: UIViewController {
    func didSelect(_ action: UIAlertAction)
}

public protocol AlertType {
    var title: String { get }
    var message: String { get }
    var delegate: AlertControllerDelegate { get }
    
    func show()
}
