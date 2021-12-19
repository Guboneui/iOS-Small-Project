//
//  ShimmerAnimationViewController.swift
//  iOS Small Project
//
//  Created by 구본의 on 2021/12/20.
//

import UIKit
import ShimmerSwift

class ShimmerAnimationViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Shimmer View
        let shimmerView = ShimmeringView(frame: CGRect(x: 0, y: 0, width: 250, height: 50))
        self.view.addSubview(shimmerView)
        shimmerView.center = self.view.center
        
        // Content View
//        let button = UIButton(frame: shimmerView.bounds)
//        button.backgroundColor = .systemIndigo
//        button.setTitle("Cool Effect", for: .normal)
//        button.layer.cornerRadius = 12
//        shimmerView.contentView = button
//
        let label = UILabel(frame: shimmerView.bounds)
        label.backgroundColor = .systemIndigo
        label.text = "Hello"
        label.font = .systemFont(ofSize: 32, weight: .bold)
        label.layer.cornerRadius = 12
        shimmerView.contentView = label
        
        
        // Start/Stop animation
        shimmerView.shimmerSpeed = 300 //   default = 230
        shimmerView.isShimmering = true
        
    }
    

  
}
