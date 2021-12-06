//
//  HomeViewController.swift
//  iOS Small Project
//
//  Created by 구본의 on 2021/12/07.
//

import UIKit

protocol HomeViewControllerDelegate: AnyObject {
    func didTapMenuButton()
}

class HomeViewController: UIViewController {

    
    weak var delegate: HomeViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBackground
        self.title = "Home"
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "list.dash"), style: .done, target: self, action: #selector(didTapMenuButton))
    }
    
    @objc func didTapMenuButton() {
        delegate?.didTapMenuButton()
    }
    

  
}
