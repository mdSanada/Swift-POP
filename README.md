# Swift-Protocol-Oriented Programming - POP Alert

`POP Alert` is a simple and flexible library for displaying custom alerts and action sheets in your iOS app. All components provided by `POP Alert` adhere to the `AlertType` protocol, showcasing the power of Protocol-Oriented Programming (POP).

## Usage

### Displaying an Alert

```swift
let alert = Alert(title: "Alert Title",
                  message: "Message in alert!",
                  buttons: .default(title: "Cancel"),
                  delegate: self)

alert.show()
```
<img src="https://github.com/mdSanada/Swift-POP/blob/development/POP_Alert.gif" width="428"/>

### Displaying an Action Sheet

```swift
let sheet = AlertSheet(title: "Alert Sheet Title",
                       message: "Message in alert sheet!",
                       buttons: .destructive(title: "Cancel"),
                       delegate: self)

sheet.show()
```

### Creating a Custom Alert

```swift
let customAlert = CustomAlert(title: "Custom Alert Title",
                              message: "Message in custom alert!",
                              image: UIImage(named: "custom_icon"),
                              button: .destructive(title: "Dismiss"),
                              delegate: self)

customAlert.show()
```

## Customization

`POP Alert` allows you to easily customize the appearance and behavior of alerts and action sheets. You can modify the title, message, buttons, and even add images to your alerts.

## Creating Custom Alerts

To create custom alerts using the `POP_Alert` framework, you can follow the pattern set by the existing alert types. This allows you to define your own custom alerts with specific behavior and styling.

### Example: Creating a CustomAlert

Here's an example of how you can create a custom alert using the provided pattern:

```swift
import UIKit

public struct CustomAlert: AlertType {
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
        let alertController = UIAlertController(title: title,
                                                message: message,
                                                preferredStyle: .alert)
        
        for button in buttons {
            alertController.addAction(button.action(handler: delegate.didSelect(_:)))
        }
        
        delegate.present(alertController, animated: true, completion: nil)
    }
}
```

In this example, the `CustomAlert` struct conforms to the `AlertType` protocol and defines its own behavior for displaying the custom alert. You can customize the properties and behavior to match your specific requirements.

To create and display a custom alert, you can use the `CustomAlert` struct in a similar way as shown in the previous sections, replacing the usage of the `Alert` struct.

This approach allows you to create different types of custom alerts while maintaining a consistent and reusable structure.

