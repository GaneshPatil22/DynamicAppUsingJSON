//
//  Factory.swift
//  DynamicAppUsingJSON
//
//  Created by Patil, Ganesh on 08/02/22.
//

import UIKit

enum ViewControllerType {
    case Login
    case Home
}

class ChildCoordinatorFactory {
    static func getCoordinator(with navigationVC: UINavigationController, type: ViewControllerType) -> ChildrenCoordinator {
        switch type {
        case .Home:
            return HomeCoordinator(with: navigationVC)
        case .Login:
            return LoginCoordinator(with: navigationVC)
        }
    }
}

struct UserData: Codable {
    let name: String
}
