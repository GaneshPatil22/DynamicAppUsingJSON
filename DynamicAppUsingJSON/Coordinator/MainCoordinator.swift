//
//  MainCoordinator.swift
//  DynamicAppUsingJSON
//
//  Created by Patil, Ganesh on 08/02/22.
//

import UIKit

class MainCoordinator: ParentCoordinator {

    var navigationController: UINavigationController

    var childCoordinators: [ChildrenCoordinator] = []

    init(with navigation: UINavigationController) {
        self.navigationController = navigation
    }
    
    func configureRootVC() {
        var coordinatorType: CoordinatorType?
        JSONReader.shared.fetchConfig {
            let dict = JSONReader.shared.configDict
            if dict.isEmpty == false, let mainConfig = dict["MainConfig"] as? [String: Any], let firstScreen = mainConfig["FirstScreen"] as? [String: Any], let type = firstScreen["type"] as? Int, let enumType = CoordinatorType(rawValue: type) {
                coordinatorType = enumType
            }
        }
        let loginCord = ChildCoordinatorFactory.getCoordinator(with: navigationController, type: coordinatorType ?? .Login)
        self.childCoordinators.append(loginCord)
        loginCord.parentCoordinator = self
        loginCord.configureChildrenVC()
    }
    
    func removeChildCord(childCord: ChildrenCoordinator) {
        for (index, cord) in childCoordinators.enumerated() {
            if childCord === cord {
                self.childCoordinators.remove(at: index)
                break
            }
        }
    }
}
