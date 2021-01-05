# Biser Alert

Simple Syntactic sugar for UIAlertController with SwiftUI Style(chain)
 
____

# Installation

1. Just drag and drop the BiserAlert.swift file to your project
2. Download Project (Green Button 'Code')

____

# Examples

____

```swift
     Alert(.alert)
            .title("Title")
            .message("Message")
            .ok("OK", action: { _ in print("ok tapped") })
            .cancel("Cancel")
            .present()
```
<img src="https://github.com/dimabiserov/Alert/blob/master/BiserAlert/Assets.xcassets/scr5.jpg" width="300" height="650">

____


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
<img src="https://github.com/dimabiserov/Alert/blob/master/BiserAlert/Assets.xcassets/scr2.jpg" width="300" height="650">

____

    
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

<img src="https://github.com/dimabiserov/Alert/blob/master/BiserAlert/Assets.xcassets/scr1.jpg" width="300" height="650">

____

```swift
             Alert(.alert)
            .title("Dismiss after 5 sec")
            .ok("OK", [.alignment(.right)])
            .ok("OK", [.alignment(.right)])
            .ok("OK", [.alignment(.right)])
            .ok("OK2", [.alignment(.left)])
            .ok("OK2", [.alignment(.left)])
            .ok("OK2", [.alignment(.left)])
            .destructive("Kangi")
            .cancel("Cancel")
            .bottomText("Bottom Text For Example", textColor: .black, backgroundColor: .red)
            .present()
            .vibro(.warning)
            .dissmiss(5)
             
```

<img src="https://github.com/dimabiserov/Alert/blob/master/BiserAlert/Assets.xcassets/scr4.jpg" width="300" height="650">

____

```swift
             Alert(.alert)
            .title("Alert")
            .message("With Image")
            .ok("OK", [.image(.SFSymbol("heart.fill", size: 20))], action: { _ in
                print("ok tapped")
            })
            .cancel("Cancel", [.image(.SFSymbol("suit.spade.fill", size: 20)),.titleColor(.red)])
            .present()
             
```

<img src="https://github.com/dimabiserov/Alert/blob/master/BiserAlert/Assets.xcassets/scr6.jpg" width="300" height="650">

____



