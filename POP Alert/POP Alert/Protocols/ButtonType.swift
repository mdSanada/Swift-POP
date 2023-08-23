//
//  ButtonType.swift
//  POP Alert
//
//  Created by Matheus Sanada on 23/08/23.
//

import UIKit

public protocol ButtonType {
    func action(handler: ((UIAlertAction) -> Void)?) -> UIAlertAction
}
