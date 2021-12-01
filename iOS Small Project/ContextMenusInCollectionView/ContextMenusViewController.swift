//
//  ContextMenusViewController.swift
//  iOS Small Project
//
//  Created by 구본의 on 2021/12/01.
//

import UIKit

class ContextMenusViewController: UIViewController {
    
    let imageNames = Array(1...5).map { "image\($0)" }
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 2
        layout.minimumLineSpacing = 2
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .systemBackground
        collectionView.register(ImageCollectionViewCell.self, forCellWithReuseIdentifier: ImageCollectionViewCell.identifier)
        return collectionView
    }()
    
    var favorites = [Int]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(self.collectionView)
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionView.frame = view.bounds
    }
}

extension ContextMenusViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.imageNames.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ImageCollectionViewCell.identifier, for: indexPath) as? ImageCollectionViewCell else {
            fatalError()
        }
        cell.imageView.image = UIImage(named: imageNames[indexPath.item])
        
        return cell
    }
}


extension ContextMenusViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (view.frame.size.width / 2) - 4, height: (view.frame.size.width / 2) - 4)
    }
    
    func collectionView(_ collectionView: UICollectionView, contextMenuConfigurationForItemAt indexPath: IndexPath, point: CGPoint) -> UIContextMenuConfiguration? {
        let config = UIContextMenuConfiguration(identifier: nil, previewProvider: nil) { [weak self] _ in
            let open = UIAction(title: "Open", image: UIImage(systemName: "link"), identifier: nil, discoverabilityTitle: nil, state: .off) { _ in
                print("tapped Open")
            }
            
            let favorite = UIAction(
                    title: self?.favorites.contains(indexPath.item) == true ? "Remove Favorite" : "Favorite",
                    image: self?.favorites.contains(indexPath.item) == true ? UIImage(systemName: "star.fill") : UIImage(systemName: "star"),
                    identifier: nil,
                    discoverabilityTitle: nil,
                    state: .off) { [weak self] _ in
                        
                guard let self = self else {return}
                if self.favorites.contains(indexPath.item) == true {
                    self.favorites.removeAll(where: { $0 == indexPath.row })
                } else {
                    self.favorites.append(indexPath.item)
                }
                print("tapped Favorite")
            }
            
            let search = UIAction(title: "Search", image: UIImage(systemName: "magnifyingglass"), identifier: nil, discoverabilityTitle: nil, state: .off) { _ in
                
                print("tapped Search")
            }
            
            return UIMenu(title: "Actions", image: nil, identifier: nil, options: UIMenu.Options.displayInline, children: [open, favorite, search])
        }
        return config
    }
}
