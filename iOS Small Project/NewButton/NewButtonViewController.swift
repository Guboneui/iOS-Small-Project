//
//  NewButtonViewController.swift
//  iOS Small Project
//
//  Created by 구본의 on 2021/12/18.
//

import UIKit

class NewButtonViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        createButton()
    }
    
    func createButton() {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
        button.center = self.view.center
        //button.configuration = createConfig()
        button.configuration = .freeTrial()
//        button.configurationUpdateHandler = { button in
//            if button.isHighlighted {
//                button.backgroundColor = .yellow
//            }
//        }
        view.addSubview(button)
        
        
    }
    
//    func createConfig() -> UIButton.Configuration {
//        var config: UIButton.Configuration = .filled()
//        config.baseBackgroundColor = .systemPink
//        config.title = "Start Free Trial"
//        config.subtitle = "Sub Title"
//        config.titleAlignment = .center
//        config.cornerStyle = .medium
//        //config.showsActivityIndicator = true
//        return config
//    }
}


extension UIButton.Configuration {
    static func freeTrial() -> UIButton.Configuration {
        
        var config: UIButton.Configuration = .filled()
        config.baseBackgroundColor = .systemIndigo
        config.title = "Start Free Trial"
        config.subtitle = "Sub Title"
        config.titleAlignment = .center
        config.cornerStyle = .medium
        //config.showsActivityIndicator = true
        return config

    }
}

