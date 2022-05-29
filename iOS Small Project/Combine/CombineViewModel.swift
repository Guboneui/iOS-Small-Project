//
//  CombineViewmodel.swift
//  iOS Small Project
//
//  Created by 구본의 on 2022/05/30.
//

import Foundation
import Combine

class CombineViewModel {
    @Published var passwordInput: String = "" {
        didSet {
            print("MyViewModel / passwordINnput: \(passwordInput)")
        }
    }
    
    @Published var passwordConfirmInput: String = "" {
        didSet {
            print("MyViewModel / passwordConfirmInput: \(passwordInput)")
        }
    }
    
    
    lazy var isMatchPasswordInput : AnyPublisher<Bool, Never> = Publishers
        .CombineLatest($passwordInput, $passwordConfirmInput)
        .map({ (password: String, passwordConfirm: String) in
            if password == "" || passwordConfirm == "" {
                return false
            }
            
            if password == passwordConfirm {
                return true
            } else {
                return false
            }
        })
        .print()
        .eraseToAnyPublisher()
    
}
