# Biser Alert

Simple Syntactic sugar for UIAlertController with SwiftUI Style(chain)
 
____

# Installation

1. Just drag and drop the BiserAlert.swift file to your project
2. Download Project (Green Button 'Code')

____

# Examples

    
```swift
         Alert(.actionSheet)
            .ok(" Gallery", [.image(.SFSymbol("rectangle.stack.fill", size: 18)), .alignment(.left), .titleColor(.black), .imageColor(UIColor.systemBlue)])
            .ok("  Camera", [.image(.SFSymbol("bolt.fill", size: 20)), .alignment(.left), .titleColor(.black), .imageColor(UIColor.systemBlue)])
            .ok("  Document", [.image(.SFSymbol("doc.text.fill", size: 20)), .alignment(.left), .titleColor(.black), .imageColor(UIColor.systemBlue)])
            .ok("  Location", [.image(.SFSymbol("location.fill", size: 20)), .alignment(.left), .titleColor(.black), .imageColor(UIColor.systemBlue)])
            .ok("  Contact", [.image(.SFSymbol("person.fill", size: 22)), .alignment(.left), .titleColor(.black), .imageColor(UIColor.systemBlue)], action: { _ in
                print("Contact Tapped")
            })
            .cancel("Cancel")
            .present()
             
```

![](https://github.com/dimabiserov/Alert/blob/master/BiserAlert/Assets.xcassets/scr1.jpg)

