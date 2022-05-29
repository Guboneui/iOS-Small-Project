//
//  CombineViewController.swift
//  iOS Small Project
//
//  Created by 구본의 on 2022/05/30.
//

import UIKit
import Combine

class CombineViewController: UIViewController {

    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var passwordConfirmTextField: UITextField!
    @IBOutlet weak var myButton: UIButton!
    
    var viewModel: CombineViewModel!
    
    private var mySubscriptions = Set<AnyCancellable>()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel = CombineViewModel()
        
        passwordTextField
            .myTextPublisher
            .print()
            .receive(on: RunLoop.main)
            .assign(to: \.passwordInput, on: viewModel) // on: 해당하는 객체
            .store(in: &mySubscriptions)
        
        passwordConfirmTextField
            .myTextPublisher
            .print()
            .receive(on: RunLoop.main)
            .assign(to: \.passwordConfirmInput, on: viewModel) // on: 해당하는 객체
            .store(in: &mySubscriptions)
        
        
        // 버튼이 뷰모델의 퍼블리셔를 구독
        viewModel.isMatchPasswordInput
            .print()
            .receive(on: RunLoop.main)
            .assign(to: \.isValid, on: myButton)
            .store(in: &mySubscriptions)
        
        
        
    }
    

}

extension UITextField {
    var myTextPublisher: AnyPublisher<String, Never> {
        NotificationCenter.default.publisher(for: UITextField.textDidChangeNotification, object: self)
            .compactMap{ $0.object as? UITextField }
            .map{ $0.text ?? "" }
            .eraseToAnyPublisher()
    }
}

extension UIButton {
    var isValid: Bool {
        get {
            backgroundColor == UIColor.yellow
        }
        set {
            backgroundColor = newValue ? .yellow : .lightGray
            isEnabled = newValue
            setTitleColor(newValue ? .blue : .white, for: .normal)
        }
    }
}
