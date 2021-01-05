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
            .title("Alert")
            .message("With Image")
            .ok("OK", [.image(.SFSymbol("heart.fill", size: 20))], action: { _ in
                print("ok tapped")
            })
            .cancel("Cancel", [.image(.SFSymbol("suit.spade.fill", size: 20)),.titleColor(.red)])
            .present()
```

![](https://github.com/dimabiserov/Alert/blob/master/BiserAlert/Assets.xcassets/scr5.jpg)
    
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

