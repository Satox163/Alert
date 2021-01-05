# Biser Alert

Simple Syntactic sugar for UIAlertController with SwiftUI Style(chain)
 
____

# Installation

1. Just drag and drop the BiserAlert.swift file to your project
2. Download Project (Green Button 'Code')

____

# Examples


```swift
     Alert(.alert)
            .title("Title")
            .message("Message")
            .ok("OK", action: { _ in print("ok tapped") })
            .cancel("Cancel")
            .present()
```

![](https://github.com/dimabiserov/Alert/blob/master/BiserAlert/Assets.xcassets/scr5.jpg)


```swift
          Alert(.alert)
            .attributedMessage("Enter Password", textColor: .white, backgroundColor: .black, font: UIFont.systemFont(ofSize: 20, weight: .medium))
            .textField {
                $0.placeholder = "I wait..."
                $0.textColor = .red
                $0.isSecureTextEntry = true
            }
            .ok("OK", action: { _ in
                print("ok tapped", AlertText)
            })
            .cancel("Cancel")
            .bottomText("Bottom Text For Example", textColor: .black, backgroundColor: .clear)
            .present()
```

![](https://github.com/dimabiserov/Alert/blob/master/BiserAlert/Assets.xcassets/scr2.jpg)
    
```swift
           Alert(.actionSheet)
            .ok("Gallery", [.image(.SFSymbol("rectangle.stack.fill", size: 18)), .alignment(.left), .titleColor(.black), .imageColor(.systemBlue)])
            .ok("Camera", [.image(.SFSymbol("bolt.fill", size: 20)), .alignment(.left), .titleColor(.black), .imageColor(.systemBlue)])
            .ok("Document", [.image(.SFSymbol("doc.text.fill", size: 20)), .alignment(.left), .titleColor(.black), .imageColor(.systemBlue)])
            .ok("Location", [.image(.SFSymbol("location.fill", size: 20)), .alignment(.left), .titleColor(.black), .imageColor(.systemBlue)])
            .ok("Contact", [.image(.SFSymbol("person.fill", size: 22)), .alignment(.left), .titleColor(.black), .imageColor(.systemBlue)], action: { _ in
                print("Contact Tapped")
            })
            .cancel("Cancel")
            .present()
             
```

![](https://github.com/dimabiserov/Alert/blob/master/BiserAlert/Assets.xcassets/scr1.jpg)

