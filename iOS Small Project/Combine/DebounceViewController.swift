//
//  DebounceViewController.swift
//  iOS Small Project
//
//  Created by 구본의 on 2022/05/30.
//

import UIKit
import Combine

class DebounceViewController: UIViewController {

  
    private lazy var searchController: UISearchController = {
        let searchController = UISearchController()
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.tintColor = .black
        searchController.searchBar.searchTextField.accessibilityIdentifier = "mySearchBarTextField"
        return searchController
    }()
    
    var mySubscription = Set<AnyCancellable>()
    
    @IBOutlet weak var myLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.navigationItem.searchController = searchController
        searchController.isActive = true
        
        searchController.searchBar.searchTextField
            .myDebounceSearchPublisher
            .sink { [weak self] (receivedValue) in
                print("receivedValue: \(receivedValue)")
                self?.myLabel.text = receivedValue
            }.store(in: &mySubscription)
    }
  

}

extension UISearchTextField {
    var myDebounceSearchPublisher: AnyPublisher<String, Never> {
        NotificationCenter.default
            .publisher(for: UISearchTextField.textDidChangeNotification, object: self)
            .compactMap{ $0.object as? UISearchTextField }
            .map{$0.text ?? "" }
            .debounce(for: .milliseconds(1000), scheduler: RunLoop.main)
            // 글자가 있을 때만 전달
            .filter{ $0.count > 0 }
            .print()
            .eraseToAnyPublisher()
    }
}
