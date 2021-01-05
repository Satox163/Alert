//
//  ViewController.swift
//  BiserAlert
//
//  Created by Дмитрий Бисеров on 05.01.2021.
//

import UIKit


class BiserAlert: UIViewController {
    
    var tableView: UITableView!
    var examples = [AlertExample]()
    
    let exampleArray = ["title1","title2","title3","title4","title5","title6"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        addTableView()
    }
    
  
    func SimpleAlert() {
        Alert(.alert)
            .title("Title")
            .message("Message")
            .ok("OK", action: { _ in print("ok tapped") })
            .cancel("Cancel")
            .present()
    }
    
    func SimpleAlertWithImage() {
        Alert(.alert)
            .title("Alert")
            .message("With Image")
            .ok("OK", [.image(.SFSymbol("heart.fill", size: 20))], action: { _ in
                print("ok tapped")
            })
            .cancel("Cancel", [.image(.SFSymbol("suit.spade.fill", size: 20)),.titleColor(.red)])
            .present()
    }
    
    func AlertWithTextField() {
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
    }
    
    
    func AlertAlignment() {
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
    }
    
    
    func ActionSheetMultiple() {
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
    }
    
    
    func ActionSheetWithImages() {
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
    }
    
}


extension BiserAlert: UITableViewDelegate, UITableViewDataSource  {
    
    struct AlertExample {
        var title : String
        var function : () -> ()
    }
    
    func fillExamples() {
        examples.append(AlertExample(title: "Simple Alert", function: SimpleAlert))
        examples.append(AlertExample(title: "Alert With Image", function: SimpleAlertWithImage))
        examples.append(AlertExample(title: "Alert With TextField", function:  AlertWithTextField))
        examples.append(AlertExample(title: "Alert AlertAlignment", function:  AlertAlignment))
        examples.append(AlertExample(title: "ActionSheet Multiple", function:  ActionSheetMultiple))
        examples.append(AlertExample(title: "ActionSheet With Images", function:   ActionSheetWithImages))
    }
    
    func addTableView() {
        fillExamples()
        tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.dataSource = self
        tableView.delegate = self
        self.view.addSubview(tableView)
        tableView.frame = view.bounds
        tableView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        tableView.rowHeight = 80
        tableView.tableFooterView = UIView()
        extendedLayoutIncludesOpaqueBars = true
        tableView.backgroundColor = UIColor.systemBackground
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        examples[indexPath.row].function()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return examples.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath as IndexPath)
        cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        cell.textLabel?.textAlignment = .center
        cell.textLabel?.font = UIFont.systemFont(ofSize: 22, weight: .medium)
        cell.textLabel?.text = examples[indexPath.row].title
        return cell
    }
    
}
