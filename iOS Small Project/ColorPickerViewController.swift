//
//  ColorPickerViewController.swift
//  iOS Small Project
//
//  Created by 구본의 on 2021/12/19.
//

import UIKit

class ColorPickerViewController: UIViewController {

    let colorWell: UIColorWell = {
        let colorWell = UIColorWell()
        colorWell.supportsAlpha = true
        colorWell.selectedColor = .white
        colorWell.title = "color well"
        return colorWell
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemRed
        colorWell.backgroundColor = .systemIndigo
        view.addSubview(colorWell)
        
        colorWell.addTarget(self, action: #selector(colorChanged), for: .valueChanged)
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        colorWell.frame = CGRect(x: 20, y: view.safeAreaInsets.top, width: view.frame.size.width - 40, height: 50)
    }
    

    @objc private func colorChanged() {
        self.view.backgroundColor = colorWell.selectedColor
    }

}
