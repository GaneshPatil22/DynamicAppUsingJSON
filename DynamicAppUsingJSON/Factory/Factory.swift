//
//  Factory.swift
//  DynamicAppUsingJSON
//
//  Created by Patil, Ganesh on 08/02/22.
//

import UIKit

enum CoordinatorType: Int {
    case Login = 1
    case Home = 2
}

class ChildCoordinatorFactory {
    static func getCoordinator(with navigationVC: UINavigationController, type: CoordinatorType) -> ChildrenCoordinator {
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
