//
//  WaterFallViewController.swift
//  iOS Small Project
//
//  Created by 구본의 on 2021/12/03.
//

import CHTCollectionViewWaterfallLayout
import UIKit

class WaterFallViewController: UIViewController {

    private let collectionView: UICollectionView = {
        let layout = CHTCollectionViewWaterfallLayout()
        layout.itemRenderDirection = .leftToRight
        layout.columnCount = 2
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(WaterFallImageCollectionViewCell.self, forCellWithReuseIdentifier: WaterFallImageCollectionViewCell.identifier)
        return collectionView
    }()
    
    struct Model {
        let imageName: String
        let height: CGFloat
    }
    
    private var models: [Model] = [
        Model(imageName: "image1", height: CGFloat.random(in: 100..<300)),
        Model(imageName: "image2", height: CGFloat.random(in: 100..<300)),
        Model(imageName: "image3", height: CGFloat.random(in: 100..<300)),
        Model(imageName: "image4", height: CGFloat.random(in: 100..<300)),
        Model(imageName: "image5", height: CGFloat.random(in: 100..<300)),
        Model(imageName: "image1", height: CGFloat.random(in: 100..<300)),
        Model(imageName: "image2", height: CGFloat.random(in: 100..<300)),
        Model(imageName: "image3", height: CGFloat.random(in: 100..<300)),
        Model(imageName: "image4", height: CGFloat.random(in: 100..<300)),
        Model(imageName: "image5", height: CGFloat.random(in: 100..<300)),
    ]
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(self.collectionView)
        self.collectionView.delegate = self
        self.collectionView.dataSource = self

    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.collectionView.frame = view.bounds
    }
}

extension WaterFallViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.models.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: WaterFallImageCollectionViewCell.identifier, for: indexPath) as? WaterFallImageCollectionViewCell else {
            fatalError()
        }
        cell.configure(image: UIImage(named: self.models[indexPath.item].imageName))
        return cell
    }
}

extension WaterFallViewController: CHTCollectionViewDelegateWaterfallLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.size.width / 2, height: self.models[indexPath.item].height)
    }
    
    
}
