//
//  CustomLabelView.swift
//  iOS Small Project
//
//  Created by 구본의 on 2022/01/06.
//

import UIKit

class CustomLabelView: UIView {
    
    var score = "0" {
        
        didSet {
            label.text = score
        }
    }
    private let label = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(label)
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 32)
        label.text = score
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        label.frame = bounds
    }

}
