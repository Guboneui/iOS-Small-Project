//
//  HapticManagerViewController.swift
//  iOS Small Project
//
//  Created by 구본의 on 2021/12/23.
//

import UIKit

class HapticManagerViewController: UIViewController {

    let button: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
        button.backgroundColor = .systemIndigo
        button.setTitle("Clicked", for: .normal)
        return button
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(button)
        self.button.center = self.view.center
        self.button.addTarget(self, action: #selector(seccessfullyBookedFlight), for: .touchUpInside)
    }
    
    @objc private func seccessfullyBookedFlight() {
        HapticsManager.shared.vibrate(for: .success)
    }


}

