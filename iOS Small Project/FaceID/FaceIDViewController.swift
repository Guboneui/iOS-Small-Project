//
//  FaceIDViewController.swift
//  iOS Small Project
//
//  Created by 구본의 on 2021/12/17.
//

import UIKit
import LocalAuthentication

class FaceIDViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
        view.addSubview(button)
        button.center = self.view.center
        button.setTitle("Authorize", for: .normal)
        button.backgroundColor = .systemGreen
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    }
    
    @objc func didTapButton() {
        let context = LAContext()
        
        var error: NSError? = nil
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            let reason = "Please authorize with touch id!"
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { [weak self] success, error in
                
                DispatchQueue.main.async {
                    guard success, error == nil else {
                        //faild
                        let alert = UIAlertController(title: "failed to authenticate", message: "please try again", preferredStyle: .alert)
                        let okButton = UIAlertAction(title: "확인", style: .default, handler: nil)
                        alert.addAction(okButton)
                        self?.present(alert, animated: true)
                        return
                    }
                    
                    // show other screen
                    // success
                    
                    let vc = UIViewController()
                    vc.title = "Welcom!"
                    vc.view.backgroundColor = .systemBlue
                    self?.present(UINavigationController(rootViewController: vc), animated: true, completion: nil)
                }
               
                
               
            }
        } else {
            // Can not use
            let alert = UIAlertController(title: "Unavailable", message: "You can't use this feather", preferredStyle: .alert)
            let okButton = UIAlertAction(title: "확인", style: .default, handler: nil)
            alert.addAction(okButton)
            present(alert, animated: true)
        }
        

        
    }
    

  
}
