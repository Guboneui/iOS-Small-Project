//
//  BlurAnimationViewController.swift
//  iOS Small Project
//
//  Created by 구본의 on 2021/12/07.
//

import UIKit

class BlurAnimationViewController: UIViewController {

    private let backGroundImage: UIImageView = {
        let image = UIImageView(image: UIImage(named: "IMG_0818"))
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        return image
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(backGroundImage)
        self.backGroundImage.frame = view.bounds
     
        createBlur()
    }
    
    func createBlur() {
        let blurEffect = UIBlurEffect(style: .light)
        let visualEffectView = UIVisualEffectView(effect: blurEffect)
        visualEffectView.frame = view.bounds
        visualEffectView.alpha = 0
        self.view.addSubview(visualEffectView)
        
        DispatchQueue.main.asyncAfter(deadline: .now()+2) {
            UIView.animate(withDuration: 0.5) {
                visualEffectView.alpha = 1
            }
        }
    }
    
}
