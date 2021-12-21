//
//  LayoutGuideViewController.swift
//  iOS Small Project
//
//  Created by 구본의 on 2021/12/21.
//

import UIKit

class MyView: UIView {
    
    private let anotherView = UIView()
    let topGuide = UILayoutGuide()
    let bottomGuide = UILayoutGuide()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .red
        
        clipsToBounds = true
        anotherView.backgroundColor = .yellow
        anotherView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(self.anotherView)
        
        addLayoutGuide(topGuide)
        addLayoutGuide(bottomGuide)
        
        NSLayoutConstraint.activate([
            topGuide.leadingAnchor.constraint(equalTo: leadingAnchor),
            topGuide.trailingAnchor.constraint(equalTo: trailingAnchor),
            topGuide.topAnchor.constraint(equalTo: topAnchor),
            topGuide.heightAnchor.constraint(equalToConstant: 100),
            anotherView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            anotherView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            anotherView.topAnchor.constraint(equalTo: topGuide.bottomAnchor),
            anotherView.bottomAnchor.constraint(equalTo: bottomGuide.topAnchor),
            bottomGuide.leadingAnchor.constraint(equalTo: leadingAnchor),
            bottomGuide.trailingAnchor.constraint(equalTo: trailingAnchor),
            bottomGuide.bottomAnchor.constraint(equalTo: bottomAnchor),
            bottomGuide.heightAnchor.constraint(equalToConstant: 100),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class LayoutGuideViewController: UIViewController {

    let myView = MyView()
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .systemIndigo
        self.view.addSubview(self.myView)
        
        myView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            myView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            myView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),
            myView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            myView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
    

   

}
