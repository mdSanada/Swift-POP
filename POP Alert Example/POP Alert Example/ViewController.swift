//
//  ViewController.swift
//  POP Alert Example
//
//  Created by Matheus Sanada on 23/08/23.
//

import UIKit
import POP_Alert

class ViewController: UIViewController, AlertControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func showAlert(_ alert: AlertType) {
        alert.show()
    }
    
    func didSelect(_ action: UIAlertAction) {
        print(action)
    }
    
    @IBAction func showAlert(_ sender: Any) {
        let alert = Alert(title: "Alert Title",
                          message: "Message in alert!",
                          buttons: .default(title: "Cancel"),
                          delegate: self)
        
        showAlert(alert)
    }
    
    @IBAction func showAlertSheet(_ sender: Any) {
        let sheet = AlertSheet(title: "Alert Sheet Title",
                               message: "Message in alert sheet!",
                               buttons: .destructive(title: "Cancel"),
                               delegate: self)
        showAlert(sheet)
    }
    
    @IBAction func showCustomAlert(_ sender: Any) {
        let custom = CustomAlert(title: "Custom Sheet Title",
                                 message: "Message in custom alert!",
                                 image: UIImage(systemName: "figure.mind.and.body")!,
                                 button: .destructive(title: "Cancel"),
                                 delegate: self)
        
        showAlert(custom)
    }
}

