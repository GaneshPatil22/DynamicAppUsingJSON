//
//  HomeCoordinator.swift
//  DynamicAppUsingJSON
//
//  Created by Patil, Ganesh on 08/02/22.
//

import UIKit

class HomeCoordinator: ChildrenCoordinator {
    weak var parentCoordinator: ParentCoordinator?
    
    var navigationController: UINavigationController
    var userName: String = ""
    
    init(with navigationVC: UINavigationController) {
        self.navigationController = navigationVC
    }
    
    func configureChildrenVC() {
        let homeVC = HomeViewController.instantiateFromStoryboard()
        homeVC.homeCordinator = self
        homeVC.userName = userName
        navigationController.pushViewController(homeVC, animated: true)
    }
    
    func navigateToLoginVC() {
        parentCoordinator?.removeChildCord(childCord: self)
        navigationController.popViewController(animated: true)
    }
    
    func setUpData(model: Codable) {
        if let userModel = model as? UserData {
            self.userName = userModel.name
        }
    }
}
