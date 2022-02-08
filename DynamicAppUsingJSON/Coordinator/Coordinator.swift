//
//  Coordinator.swift
//  DynamicAppUsingJSON
//
//  Created by Patil, Ganesh on 08/02/22.
//

import UIKit

protocol Coordinator: AnyObject {
    var navigationController: UINavigationController { get set }
    func setUpData(model: Codable)
}

extension Coordinator {
    func setUpData(model: Codable) {}
}

protocol ParentCoordinator: Coordinator {
    var childCoordinators: [ChildrenCoordinator] { get set }
    func configureRootVC()
    func removeChildCord(childCord: ChildrenCoordinator)
}

protocol ChildrenCoordinator: Coordinator {
    var parentCoordinator: ParentCoordinator? { get set }
    func configureChildrenVC()
}

protocol CoordinatorBoard: UIViewController {
    static func instantiateFromStoryboard() -> Self
}

extension CoordinatorBoard {
    static func instantiateFromStoryboard() -> Self {
        let storyBoard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let id = String(describing: self)
        return storyBoard.instantiateViewController(withIdentifier: id) as! Self
    }
}
