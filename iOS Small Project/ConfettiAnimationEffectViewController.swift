//
//  ConfettiAnimationEffectViewController.swift
//  iOS Small Project
//
//  Created by 구본의 on 2021/12/19.
//

import UIKit

class ConfettiAnimationEffectViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
        self.view.addSubview(button)
        button.center = self.view.center
        button.backgroundColor = .systemIndigo
        button.setTitle("Start", for: .normal)
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        
    }
    
    @objc func didTapButton() {
        createLayer()
    }
    
    private func createLayer() {
        let layer = CAEmitterLayer()
        layer.emitterPosition = CGPoint(x: view.center.x, y: view.center.y)
        
        let cell = CAEmitterCell()
        cell.scale = 0.1
        cell.emissionRange = .pi * 2
        cell.lifetime = 20
        cell.birthRate = 100
        cell.velocity = 10
        //cell.color = UIColor.systemPink.cgColor // whiteImage only
        cell.contents = UIImage(named: "blackImage")!.cgImage
        
        layer.emitterCells = [cell]
        view.layer.addSublayer(layer)
    }

}
