import UIKit

public final class Alert {
    public typealias AlertAction = ((UIAlertAction?) -> Void)?
    
    private let alert: UIAlertController
    private let title: String?
    private let message: String?
    private let style: UIAlertController.Style
    
    public init(
        title: String? = nil,
        message: String? = nil,
        style: UIAlertController.Style
    ) {
        alert = UIAlertController(title: title, message: message, preferredStyle: style)
        self.title = title
        self.message = message
        self.style = style
    }
}

extension Alert {
    @discardableResult
    public func multiple(titles: [String], action: AlertAction) -> Self {
        titles.forEach { title in
            alert.addAction(UIAlertAction(title: title, style: .default, handler: action))
        }
        return self
    }

    @discardableResult
    public func bottomText(
        _ text: String,
        textColor: UIColor? = .black,
        backgroundColor: UIColor? = .clear
    ) -> Self {
        let textOptions: [NSAttributedString.Key: Any] = [
            .backgroundColor: backgroundColor ?? .clear,
            .foregroundColor: textColor ?? .black,
        ]
        let finalText = NSAttributedString(string: text, attributes: textOptions)
        alert.setValue(finalText, forKey: "_attributedDetailMessage")
        return self
    }

    @discardableResult
    public func attributedTitle(
        _ text: String,
        textColor: UIColor? = .black,
        backgroundColor: UIColor? = .clear,
        font: UIFont? = UIFont.systemFont(ofSize: 17, weight: .bold)
    ) -> Self {
        let textOptions: [NSAttributedString.Key: Any] = [
            .backgroundColor: backgroundColor ?? .clear,
            .foregroundColor: textColor ?? .red,
            NSAttributedString.Key.font: font ?? UIFont.systemFont(ofSize: 16),
        ]
        let finalText = NSAttributedString(string: text, attributes: textOptions)
        alert.setValue(finalText, forKey: "_attributedTitle")
        return self
    }

    @discardableResult
    public func attributedMessage(
        _ text: String,
        textColor: UIColor? = .black,
        backgroundColor: UIColor? = .clear,
        font: UIFont? = UIFont.systemFont(ofSize: 15, weight: .regular)
    ) -> Self {
        let textOptions: [NSAttributedString.Key: Any] = [
            .backgroundColor: backgroundColor ?? .clear,
            .foregroundColor: textColor ?? .red,
            NSAttributedString.Key.font: font ?? UIFont.systemFont(ofSize: 16),
        ]
        let finalText = NSAttributedString(string: text, attributes: textOptions)
        alert.setValue(finalText, forKey: "_attributedMessage")
        return self
    }

    @discardableResult
    public func title(_ title: String) -> Self {
        alert.title = title
        return self
    }

    @discardableResult
    public func message(_ message: String) -> Self {
        alert.message = message
        return self
    }

    @discardableResult
    public func present(
        in controller: UIViewController,
        completion: @escaping () -> Void = {}
    ) -> Self {
        controller.present(alert, animated: true, completion: completion)
        return self
    }

    @discardableResult
    public func dissmiss(
        _ seconds: TimeInterval,
        completion: @escaping () -> Void = {}
    ) -> Self {
        DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
            self.alert.dismiss(animated: true, completion: completion)
        }
        return self
    }

    @discardableResult
    public func cancel(
        _ title: String?,
        _ settings: Set<ActionSettings>? = nil,
        action: AlertAction = nil
    ) -> Self {
        actionSettings(title, style: .cancel, action: action, settings: settings)
        return self
    }

    @discardableResult
    public func ok(
        _ title: String?,
        _ settings: Set<ActionSettings>? = nil,
        action: AlertAction = nil
    ) -> Self {
        actionSettings(title, style: .default, action: action, settings: settings)
        return self
    }

    @discardableResult
    public func destructive(
        _ title: String?,
        _ settings: Set<ActionSettings>? = nil,
        action: AlertAction = nil
    ) -> Self {
        actionSettings(
            title,
            style: .destructive,
            action: action,
            settings: settings
        )
        return self
    }

    public func actionSettings(
        _ title: String?,
        style: UIAlertAction.Style,
        action: AlertAction = nil,
        settings: Set<ActionSettings>?
    ) {
        let action = UIAlertAction(
            title: title == nil ? "None" : title,
            style: style,
            handler: action
        )
        settings?.forEach { settings in
            settings.apply(action: action)
        }
        alert.addAction(action)
    }

    @discardableResult
    public func textField(
        _ configurationHandler: @escaping (UITextField) -> Void
    ) -> Self {
        guard style == .alert else { return self }
        alert.addTextField(configurationHandler: configurationHandler)
        return self
    }
}
