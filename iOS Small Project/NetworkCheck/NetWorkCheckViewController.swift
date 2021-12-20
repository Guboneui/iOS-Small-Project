//
//  NetWorkCheckViewController.swift
//  iOS Small Project
//
//  Created by 구본의 on 2021/12/20.
//

import UIKit

class NetWorkCheckViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        if NetworkMonitor.shared.isConnected {
            print("You're Connected")
        } else {
            print("You're need Connected")
        }
    }
    

 
}
