//
//  CallingViewController.swift
//  iOS Small Project
//
//  Created by 구본의 on 2021/12/03.
//

import UIKit

class CallingViewController: UIViewController {

    private let callingButton: UIButton = {
        let button = UIButton()
        button.setTitle("전화 걸기", for: .normal)
        button.backgroundColor = .gray
        button.tintColor = .white
        return button
    }()
    

    override func loadView() {
        super.loadView()
        self.view.addSubview(callingButton)
        callingButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
       
            callingButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            callingButton.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)

        ])
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        callingButton.addTarget(self, action: #selector(callMethod), for: .touchUpInside)
    }
    
    @objc func callMethod(_ sender: UIButton) {
        
        // 처음 alert를 통해 메소드를 연결하는 줄 알았지만, iOS 내장 함수 존재
        // 참고 블로그 링크 -> https://borabong.tistory.com/7
        
        let urlString = "tel://" + "010-0000-0000"
        if let url = NSURL(string: urlString), UIApplication.shared.canOpenURL(url as URL) {
            UIApplication.shared.open(url as URL, options: [:], completionHandler: nil)
        }
        
    }


}
