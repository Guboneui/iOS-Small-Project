//
//  RxViewModel.swift
//  iOS Small Project
//
//  Created by 구본의 on 2021/12/30.
//

import Foundation
import RxSwift
import RxRelay



struct Menu {
    // 뷰에서 표현되어야 하는 struct -> View를 위한 모델
    var id: Int
    var name: String
    var price: Int
    var count: Int
    
}

class MenuListViewModel {
   
    var menuObservable = BehaviorRelay<[Menu]>(value: [])
    
    lazy var itemsCount = self.menuObservable.map {
        $0.map { $0.count }.reduce(0, +)
    }
    
    lazy var totalPrice = self.menuObservable.map {
        $0.map { $0.price * $0.count }.reduce(0, +)
    }
    
    // Subject = 옵저버블 처럼 값을 받을 수도 있지만, 외부에서 값을 통제할 수도 있음.
    
    init() {
        _ = APIService.fetchAllMenusRx()
            .map { data -> [MenuItem] in
                struct Response: Decodable {
                    let menus: [MenuItem]
                }
                let response = try! JSONDecoder().decode(Response.self, from: data)
                return response.menus
            }
            .map { menuItems -> [Menu] in
                var menus: [Menu] = []
                menuItems.enumerated().forEach { (index, item) in
                    let menu = Menu.fromMenuItems(id: index, item: item)
                    menus.append(menu)
                }
                return menus
            }
            .take(1)
            .bind(to: menuObservable)
        
        
    }
    
    func clearAllItemSelections() {
        _ = menuObservable
            .map { menus in
                menus.map { m in
                    Menu(id: m.id, name: m.name, price: m.price, count: 0)
                }
            }
            .take(1)
            .subscribe(onNext: {
                self.menuObservable.accept($0)
            })
    }
    
    func changeCount(item: Menu, increase: Int) {
        _ = menuObservable
            .map { menus in
                menus.map { m -> Menu in
                    if m.id == item.id {
                        return Menu(id: m.id, name: m.name, price: m.price, count: max(m.count + increase, 0))
                    } else {
                        return Menu(id: m.id, name: m.name, price: m.price, count: m.count)
                    }
                    
                }
            }
            .take(1)
            .subscribe(onNext: {
                self.menuObservable.accept($0)
            })
    }
    
    func onOrder() {
        
    }
}

