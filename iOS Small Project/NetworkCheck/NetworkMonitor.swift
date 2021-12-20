//
//  NetworkMonitor.swift
//  iOS Small Project
//
//  Created by 구본의 on 2021/12/20.
//

import Foundation
import Network

final class NetworkMonitor {
    static let shared = NetworkMonitor()
    
    private let queue = DispatchQueue.global()
    private let monitor: NWPathMonitor
    
    public private(set) var isConnected: Bool = false
    
    public private(set) var connectionType: ConnectionType = .unknown
    
    
    enum ConnectionType {
        case wifi
        case cellular
        case ethernet
        case unknown
    }
    
    private init() {
        self.monitor = NWPathMonitor()
    
    }
    
    public func startMonitoring() {
        monitor.start(queue: queue)
        monitor.pathUpdateHandler = {[weak self] path in
            
            guard let self = self else {return}
            //self.isConnected = path.status == .satisfied
            self.isConnected = path.status != .unsatisfied
            self.getConnectionType(path)
            print("Network - startMonitoring() - isConnected: \(self.isConnected)")
            
        }
    }
    
    public func stopMonitoring() {
        monitor.cancel()
    }
    
    private func getConnectionType(_ path: NWPath) {
        if path.usesInterfaceType(.wifi) {
            connectionType = .wifi
            print("wifi connected")
        } else if path.usesInterfaceType(.cellular) {
            connectionType = .cellular
            print("cellular connected")
        } else if path.usesInterfaceType(.wiredEthernet) {
            connectionType = .ethernet
            print("ethernet connected")
        } else {
            connectionType = .unknown
            print("unknown connected")
        }
    }
}
