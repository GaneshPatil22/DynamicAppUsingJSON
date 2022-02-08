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
        let loginCord = ChildCoordinatorFactory.getCoordinator(with: navigationController, type: .Login)
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
