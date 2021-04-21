//
//  Coordinator.swift
//  CoordinatorsDemo
//
//  Created by Ravi Kumar Yaganti on 20/04/21.
//

import Foundation
import UIKit

/// Useful references
///https://www.youtube.com/watch?v=SAZzcKvOvAE&list=RDCMUCnksRRifsSCGUZpQukUKAyg&start_radio=1&t=1219
///  https://saad-eloulladi.medium.com/ios-coordinator-pattern-in-swift-39a15aa3b01b
/// To understand more about coordinator pattern


protocol BaseEvent {
    
}

protocol Coordinator: class {
    // All coordinators will be initilised with a navigation controller
    init(navigationController:UINavigationController)
    var childCoordinator: [Coordinator] { get set }
    func evenOccurred(with type: BaseEvent)
    func start()
}


protocol Coordinating {
    var coordinator: Coordinator? { get set }
}
