//
//  ShakeGestureViewController.swift
//  iOS Small Project
//
//  Created by 구본의 on 2021/12/03.
//

import UIKit


// 1. VC needs to be first responder
// 2. VC needs to be able to become 1st responder
// 3. Detect shake
class ShakeGestureViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBlue
        becomeFirstResponder()
        
    }
    
    override var canBecomeFirstResponder: Bool {
        return true
    }
    
    
    override func motionBegan(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            let vc = UIViewController()
            vc.view.backgroundColor = .orange
            present(vc, animated: true)
            
//            let alert = UIAlertController(title: "Shake", message: "user got mad and shoot thir phone", preferredStyle: .alert)
//            alert.addAction(UIAlertAction(title: "dismiss", style: .cancel, handler: nil))
//            present(alert, animated: true)
        }
    }

   

}
