//
//  HomeViewController.swift
//  DynamicAppUsingJSON
//
//  Created by Patil, Ganesh on 08/02/22.
//

import UIKit

class HomeViewController: UIViewController, CoordinatorBoard {

    @IBOutlet weak var userNameTextField: UILabel!
    var userName: String?
    weak var homeCordinator: HomeCoordinator?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true
        userNameTextField.text = userName
        view.backgroundColor = .blue
    }
    
    @IBAction func logoutUserAction(_ sender: Any) {
        homeCordinator?.navigateToLoginVC()
    }
}
