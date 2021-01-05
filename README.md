# Biser Alert

Simple Syntactic sugar for UIAlertController with SwiftUI Style(chain)
 
____

# Installation

1. Just drag and drop the BiserAlert.swift file to your project
2. Download Project (Green Button 'Code')

____

# Examples

```swift
 // Simple Alert
 
        Alert(.alert)
            .title("Title")
            .message("Message")
            .ok("OK", action: { _ in print("ok tapped") })
            .cancel("Cancel")
            .present()
            
```

    
    ![Algorithm schema](Alert/BiserAlert/Assets.xcassets/scr1.jpg)
    
    ![](https://github.com/dimabiserov/Alert/blob/master/BiserAlert/Assets.xcassets/scr1.jpg)

