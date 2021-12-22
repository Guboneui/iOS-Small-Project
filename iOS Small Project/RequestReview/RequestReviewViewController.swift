//
//  RequestReviewViewController.swift
//  iOS Small Project
//
//  Created by 구본의 on 2021/12/22.
//

import UIKit
import StoreKit

class RequestReviewViewController: UIViewController {

    private let button: UIButton = {
        let button = UIButton()
        button.setTitle("Rate Now", for: .normal)
        button.backgroundColor = .systemIndigo
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(button)
        button.frame = CGRect(x: 0, y: 0, width: 200, height: 55)
        button.center = self.view.center
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)


    }
    
    @objc func didTapButton() {
        
        let alert = UIAlertController(title: "Feedback", message: "Are you enjoying the app?", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "Yes, I love it", style: .default, handler: { [weak self] _ in
            guard let scene = self?.view.window?.windowScene else {
                print("no scene")
                return
            }
            SKStoreReviewController.requestReview(in: scene)
            
            
        }))
        alert.addAction(UIAlertAction(title: "No, this sucks", style: .default, handler: { _ in
            // collect feedback
            // prompt user to email you
            // open safari to your contact page
            
        }))
        
        self.present(alert, animated: true)
        
//        guard let scene = self.view.window?.windowScene else {
//            print("no scene")
//            return
//        }
//        SKStoreReviewController.requestReview(in: scene)
    }
}


