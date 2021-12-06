//
//  SideMenuViewController.swift
//  iOS Small Project
//
//  Created by 구본의 on 2021/12/07.
//

import UIKit

protocol SideMenuViewControllerDelegate: AnyObject {
    func didSelect(menuItem: SideMenuViewController.MenuOptions)
}


class SideMenuViewController: UIViewController {

    weak var delegate: SideMenuViewControllerDelegate?
    
    enum MenuOptions: String, CaseIterable {
        case home = "Home"
        case info = "Information"
        case appRating = "App Rating"
        case shareApp = "Share App"
        case setting = "Settings"
        
        var imageName: String {
            switch self {
            case .home:
                return "house"
            case .info:
                return "airplane"
            case .appRating:
                return "star"
            case .shareApp:
                return "message"
            case .setting:
                return "gear"
            }
        }
    }
    
    private let tableView: UITableView = {
        let table = UITableView()
        table.backgroundColor = .lightGray
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(self.tableView)
        self.tableView.delegate = self
        self.tableView.dataSource = self
        view.backgroundColor = UIColor(red: 33/255.0, green: 33/255.0, blue: 33/255.0, alpha: 1.0)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = CGRect(x: 0, y: view.safeAreaInsets.top, width: view.bounds.size.width, height: view.bounds.size.height)
    }
}

extension SideMenuViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MenuOptions.allCases.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = MenuOptions.allCases[indexPath.row].rawValue
        cell.backgroundColor = .lightGray
        cell.contentView.backgroundColor = .lightGray
        cell.imageView?.image = UIImage(systemName: MenuOptions.allCases[indexPath.row].imageName)
        cell.imageView?.tintColor = .black
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let item = MenuOptions.allCases[indexPath.row]
        delegate?.didSelect(menuItem: item)
    }
    
}
