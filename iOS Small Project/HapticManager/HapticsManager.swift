//
//  HapticsManager.swift
//  iOS Small Project
//
//  Created by 구본의 on 2021/12/23.
//

import Foundation
import UIKit

final class HapticsManager {
    static let shared = HapticsManager()
    
    private init() {
        
    }
    
    public func selectionVibrate() {
        
        DispatchQueue.main.async {
            let selectionFeedbackGenerator = UISelectionFeedbackGenerator()
            selectionFeedbackGenerator.prepare()
            selectionFeedbackGenerator.selectionChanged()
        }
        
        
        
    }
    
    
    public func vibrate(for type: UINotificationFeedbackGenerator.FeedbackType) {
        
        DispatchQueue.main.async {
            let notificationGenerator = UINotificationFeedbackGenerator()
            notificationGenerator.prepare()
            notificationGenerator.notificationOccurred(type)
        }
       
    }
}
