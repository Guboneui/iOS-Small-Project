//
//  ContainerViewController.swift
//  iOS Small Project
//
//  Created by 구본의 on 2021/12/07.
//

import UIKit

class ContainerViewController: UIViewController {
    
    enum MenuState {
        case opend
        case closed
    }
    
    private var menuState: MenuState = .closed
    
    let menuVC = SideMenuViewController()
    let homeVC = HomeViewController()
    var navVC: UINavigationController?
    lazy var infoVC = InfoViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //self.view.backgroundColor = .red
        addChildVCs()
    }
    
    private func addChildVCs() {
        // Menu
        menuVC.delegate = self
        addChild(menuVC)
        view.addSubview(menuVC.view)
        menuVC.didMove(toParent: self)
        
        
        // Home
        homeVC.delegate = self
        let navVC = UINavigationController(rootViewController: homeVC)
        addChild(navVC)
        view.addSubview(navVC.view)
        navVC.didMove(toParent: self)
        self.navVC = navVC
        
    }
    
}

extension ContainerViewController: HomeViewControllerDelegate {
    func didTapMenuButton() {
        toggleMenu {
            self.toggleMenu(completion: nil)
        }
    }
    
    func toggleMenu(completion: (() -> Void)?) {
        // Animate the menu
        switch self.menuState {
            case .closed:
                // open it
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut) {
                self.navVC?.view.frame.origin.x = self.homeVC.view.frame.size.width - 100
            } completion: { [weak self] done in
                if done {
                    self?.menuState = .opend
                    
                }
            }

            
            case .opend:
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut) {
                self.navVC?.view.frame.origin.x = 0
            } completion: { [weak self] done in
                if done {
                    self?.menuState = .closed
                    DispatchQueue.main.async {
                        completion?()
                    }
                }
            }
        }
    }
}

extension ContainerViewController: SideMenuViewControllerDelegate {
    func didSelect(menuItem: SideMenuViewController.MenuOptions) {
         
        toggleMenu(completion: nil)
        switch menuItem {
            case .home:
                self.resetToHome()
            case .info:
                self.addInfo()
            case .appRating:
                break
            case .shareApp:
                break
            case .setting:
                break
        }
        
    }
    
    func addInfo() {
        let vc = infoVC
        homeVC.addChild(vc)
        homeVC.view.addSubview(vc.view)
        vc.view.frame = view.frame
        vc.didMove(toParent: homeVC)
        homeVC.title = vc.title
    }
    
    func resetToHome() {
        infoVC.view.removeFromSuperview()
        infoVC.didMove(toParent: nil)
        homeVC.title = "Home"
    }
    
    
}
