//
//  DidSetViewController.swift
//  iOS Small Project
//
//  Created by 구본의 on 2022/01/06.
//

import UIKit

class Observer<T> {
    var value: T? {
        didSet {
            observerBlock?(value)
        }
    }
    
    init(value: T?) {
        self.value = value
    }
    
    private var observerBlock: ((T?) -> Void)?
    func add(_ observer: @escaping (T?) -> Void) {
        self.observerBlock = observer
    }
}

class DidSetViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    private var fruits = Observer.init(value: ["사과", "오렌지", "포도"])
    
    private let table: UITableView = {
        let tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return tableView
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(table)
        table.frame = self.view.bounds
        table.dataSource = self

        fruits.add { [weak self] fruits in
            print("updated fruits: \(fruits ?? [])\n\n")
            DispatchQueue.main.async {
                self?.table.reloadData()
            }
        }
        
        let more = ["a", "b", "c"]
        for x in 0..<2 {
            DispatchQueue.main.asyncAfter(deadline: .now() + (1 * TimeInterval(x))) {
                self.fruits.value?.append(more.randomElement() ?? "")
            }
        }
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.fruits.value?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = self.fruits.value?[indexPath.row]
        return cell
    }
}
