//
//  BiserAlert.swift
//  BiserAlert
//
//  Created by Дмитрий Бисеров on 05.01.2021.
//

import UIKit

//you can change the "Alert" to any word
typealias Alert = UIViewController.BiserAlert


//yes, yes this is a global var the easiest way to make text field
var AlertText = String()

extension UIViewController {
    class BiserAlert {
        var alert : UIAlertController!
        var title : String? = nil
        var message : String? = nil
        var style : UIAlertController.Style
        
        init(title: String? = nil, message: String? = nil, _ style : UIAlertController.Style) {
            alert = UIAlertController(title: title, message: message, preferredStyle: style)
            self.style = style
        }
    }
}


extension UIViewController.BiserAlert {
    
    typealias AlertAction = ((UIAlertAction? )->())?
    
    //Sometimes you need to do a lot of actions at the alert
    @discardableResult
    func multiple(titles: [String], action: AlertAction) -> Self {
        titles.forEach { (title) in
            alert.addAction(UIAlertAction(title: title, style: .default, handler: action))
        }
        return self
    }
    
    @discardableResult
    func bottomText(_ text: String, textColor: UIColor? = .black, backgroundColor: UIColor? = .clear) -> Self {
        let textOptions: [NSAttributedString.Key: Any] = [
            .backgroundColor: backgroundColor ?? .clear,
            .foregroundColor: textColor ?? .black
        ]
        let finalText = NSAttributedString(string: text, attributes: textOptions)
        alert.setValue(finalText, forKey: "_attributedDetailMessage")
        return self
    }
    
    @discardableResult
    func attributedTitle(_ text: String, textColor: UIColor? = .black, backgroundColor: UIColor? = .clear, font: UIFont? = UIFont.systemFont(ofSize: 17, weight: .bold)) -> Self {
        let textOptions: [NSAttributedString.Key: Any] = [
            .backgroundColor: backgroundColor ?? .clear,
            .foregroundColor: textColor ?? .red,
            NSAttributedString.Key.font: font ?? UIFont.systemFont(ofSize: 16)
        ]
        let finalText = NSAttributedString(string: text, attributes: textOptions)
        alert.setValue(finalText, forKey: "_attributedTitle")
        return self
    }
    
    @discardableResult
    func attributedMessage(_ text: String, textColor: UIColor? = .black, backgroundColor: UIColor? = .clear, font: UIFont? = UIFont.systemFont(ofSize: 15, weight: .regular)) -> Self {
        let textOptions: [NSAttributedString.Key: Any] = [
            .backgroundColor: backgroundColor ?? .clear,
            .foregroundColor: textColor ?? .red,
            NSAttributedString.Key.font: font ?? UIFont.systemFont(ofSize: 16)
        ]
        let finalText = NSAttributedString(string: text, attributes: textOptions)
        alert.setValue(finalText, forKey: "_attributedMessage")
        return self
    }
    
    @discardableResult
    func title(_ title: String) -> Self {
        alert.title = title
        return self
    }
    
    @discardableResult
    func message(_ message: String) -> Self {
        alert.message = message
        return self
    }
    
    @discardableResult
    func present() -> Self {
        topController().present(self.alert, animated: true, completion: nil)
        return self
    }
    
    @discardableResult
    func dissmiss(_ seconds: TimeInterval) -> Self {
        DelayTask(seconds) {
            self.alert.dismiss(animated: true)
        }
        return self
    }
    
    @discardableResult
    func cancel(_ title: String?, _ settings: Set<ActionSettings>? = nil, action: AlertAction = nil) -> Self {
        actionSettings(title, style: .cancel, action: action, settings: settings)
        return self
    }
    
    @discardableResult
    func ok(_ title: String?, _ settings: Set<ActionSettings>? = nil, action: AlertAction = nil) -> Self {
        actionSettings(title, style: .default, action: action, settings: settings)
        return self
    }
    
    @discardableResult
    func destructive(_ title: String?, _ settings: Set<ActionSettings>? = nil, action: AlertAction = nil) -> Self {
        actionSettings(title, style: .destructive, action: action, settings: settings)
        return self
    }
    
    func actionSettings(_ title: String?, style: UIAlertAction.Style, action: AlertAction = nil, settings: Set<ActionSettings>?)  {
        let action = UIAlertAction(title: title == nil ? "None" : title, style: style, handler: action)
        if let finalSettings = settings {
            finalSettings.forEach({ (settings) in
                settings.apply(action: action)
            })
        }
        alert.addAction(action)
    }
    
    @discardableResult
    func textField(_ configurationHandler: ((UITextField) -> Void)? = nil) -> Self {
        guard style == .alert else { return self }
        alert.addTextField(configurationHandler: configurationHandler)
        NotificationCenter.default.addObserver(forName: UITextField.textDidChangeNotification, object: nil, queue: .main) { _ in
            if let text = self.alert.textFields?.first?.text { AlertText = text }
        }
        return self
    }
}

enum ActionSettings : Hashable {
    case alignment(ActionTitleTextAlignment)
    case image(UIImage?)
    case imageColor(UIColor?)
    case titleColor(UIColor?)
    case checked(Bool)
    
    func apply(action: UIAlertAction) {
        switch self {
        case .alignment(let alignment):
            action.setValue(alignment.rawValue, forKey: "titleTextAlignment")
        case .image(let image):
            action.setValue(image, forKey: "image")
        case .imageColor(let color):
            action.setValue(color, forKey: "imageTintColor")
        case .titleColor(let color):
            action.setValue(color, forKey: "titleTextColor")
        case .checked:
            action.setValue(true, forKey: "checked")
        }
    }
    enum ActionTitleTextAlignment: Int {
        case left = 0
        case center = 1
        case right = 2
    }
}

//Vibration, you can make this function global and use it everywhere

extension UIViewController.BiserAlert {
    enum VibroStyle {
        case light, medium, heavy, success, warning, error
    }
    func vibro(_ style: VibroStyle? = .medium) -> Self {
        if style == .light || style == .medium || style == .heavy {
            var vibroStyle: UIImpactFeedbackGenerator.FeedbackStyle = .medium
            if style == .light { vibroStyle = .light }
            if style == .medium { vibroStyle = .medium }
            if style == .heavy { vibroStyle = .heavy }
            UIImpactFeedbackGenerator(style: vibroStyle).impactOccurred()
        }
        if style == .success || style == .warning || style == .error {
            var vibroStyle: UINotificationFeedbackGenerator.FeedbackType = .success
            if style == .success { vibroStyle = .success }
            if style == .warning { vibroStyle = .warning }
            if style == .error { vibroStyle = .error }
            UINotificationFeedbackGenerator().notificationOccurred(vibroStyle)
        }
        return self
    }
}


/// Functions && Extensions

func topController() -> UIViewController {
    var topVC = UIApplication.shared.windows.filter {$0.isKeyWindow}.first?.rootViewController
    while topVC != nil {
        if let vc = (topVC as? UITabBarController)?.selectedViewController {
            topVC = vc
        }
        else if let vc = (topVC as? UINavigationController)?.visibleViewController {
            topVC = vc
        }
        else if let vc = topVC?.presentedViewController {
            topVC = vc
        }
        else {
            break
        }
    }
    return topVC!
}

func DelayTask(_ timeInteval: TimeInterval, _ task: @escaping () -> ()) {
    DispatchQueue.main.asyncAfter(deadline: (.now() + timeInteval)) {
        task()
    }
}

//Download free SF Symbols App - https://developer.apple.com/sf-symbols/
extension UIImage {
    static func SFSymbol(_ name: String,size : CGFloat? = 20, weight : UIImage.SymbolWeight? = .medium, scale: UIImage.SymbolScale? = .default) -> UIImage {
        if let finalSize = size {
            let imageConfig = UIImage.SymbolConfiguration(pointSize: finalSize, weight: weight ?? .medium, scale: scale ?? .default )
            return UIImage(systemName: name, withConfiguration: imageConfig) ?? UIImage()
        }
        else {
            return UIImage(systemName: name) ?? UIImage()
        }
    }
}
