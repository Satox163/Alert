# Biser Alert

Simple Syntactic sugar for UIAlertController with SwiftUI Style(chain)
 
____

# Installation

Just drag and drop the BiserAlert.swift file to your project

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
    
    
 
        Alert(.alert)
            .title("Alert")
            .message("With Image")
            .ok("OK", [.image(.SFSymbol("heart.fill", size: 20))], action: { _ in
                print("ok tapped")
            })
            .cancel("Cancel", [.image(.SFSymbol("suit.spade.fill", size: 20)),.titleColor(.red)])
            .present()
    
    
   
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
    
    
    
   
        Alert(.actionSheet)
            .title("Many Buttons")
            .multiple(titles: self.exampleArray, action: { (action) in
                //usually you need to know the index in the array
                if let title = action?.title, let index = self.exampleArray.firstIndex(of: (title)) {
                    print(title, index)
                }
            })
            .cancel("Cancel")
            .present()
    
    
    
   
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
