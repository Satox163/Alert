import UIKit

public enum ActionSettings: Hashable {
    
    public enum ActionTitleTextAlignment: Int {
        case left
        case center
        case right
    }
    
    case alignment(ActionTitleTextAlignment)
    case image(UIImage?)
    case imageColor(UIColor?)
    case titleColor(UIColor?)
    case checked(Bool)

    public func apply(action: UIAlertAction) {
        switch self {
        case let .alignment(alignment):
            action.setValue(alignment.rawValue, forKey: "titleTextAlignment")
        case let .image(image):
            action.setValue(image, forKey: "image")
        case let .imageColor(color):
            action.setValue(color, forKey: "imageTintColor")
        case let .titleColor(color):
            action.setValue(color, forKey: "titleTextColor")
        case .checked:
            action.setValue(true, forKey: "checked")
        }
    }
}

