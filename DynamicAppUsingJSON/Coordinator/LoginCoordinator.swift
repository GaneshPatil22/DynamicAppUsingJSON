//
//  MainCoordinator.swift
//  DynamicAppUsingJSON
//
//  Created by Patil, Ganesh on 08/02/22.
//

import UIKit

class LoginCoordinator: ChildrenCoordinator {
    weak var parentCoordinator: ParentCoordinator?
    
    var navigationController: UINavigationController
    
    init(with navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func configureChildrenVC() {
        let loginVC = LoginViewController.instantiateFromStoryboard()
        loginVC.mainCoordinator = self
        navigationController.pushViewController(loginVC, animated: false)
    }
    
    func configureHomeVC(userName: String) {
        let childCorrdinator = HomeCoordinator(with: navigationController)
        childCorrdinator.setUpData(model: UserData(name: userName))
        self.parentCoordinator?.childCoordinators.append(childCorrdinator)
        childCorrdinator.parentCoordinator = parentCoordinator
        childCorrdinator.configureChildrenVC()
    }
    
    func configureResetPasswordVC() {
        let resetVC = ResetPasswordViewController.instantiateFromStoryboard()
        navigationController.pushViewController(resetVC, animated: false)
    }
    
    
}
