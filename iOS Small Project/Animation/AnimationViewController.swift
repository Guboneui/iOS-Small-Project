//
//  AnimationViewController.swift
//  iOS Small Project
//
//  Created by 구본의 on 2021/12/25.
//

import UIKit

class AnimationViewController: UIViewController {

    
    private let myView: UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        view.backgroundColor = .systemIndigo
        return view
    }()
    
    private let myButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemGray
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.addSubview(myView)
        self.myView.center = self.view.center
        
        self.view.addSubview(myButton)
        self.myButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            myButton.topAnchor.constraint(equalTo: self.myView.bottomAnchor, constant: 150),
            myButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 30),
            myButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -30),
            myButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        ])
        
        myButton.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            UIView.animate(withDuration: 0.3) {
                self.applyMultiple()
            } completion: { done in
                if done {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        UIView.animate(withDuration: 1) {
                            self.myView.transform = .identity
                        }
                    }
                }
            }
        }
    }
    
    func scale() {
        self.myView.transform = CGAffineTransform(scaleX: 2, y: 2)
    }
    
    func rotate() {
        self.myView.transform = CGAffineTransform(rotationAngle: .pi / 2)
    }
    
    func translate() {
        self.myView.transform = CGAffineTransform(translationX: 100, y: 200)
    }
    
    
    func applyMultiple() {
        self.myView.transform = CGAffineTransform(rotationAngle: .pi / 2)
            .concatenating(CGAffineTransform(translationX: -100, y: -200))
            .concatenating(CGAffineTransform(scaleX: 0.5, y: 0.5))
    }

    @objc func didTapButton() {
        print("did tap button")
        UIView.animate(withDuration: 0.5) {
            //self.rotate()
            self.translate()
        }
    }
    

}
