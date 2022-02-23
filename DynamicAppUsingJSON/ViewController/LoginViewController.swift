//
//  ViewController.swift
//  DynamicAppUsingJSON
//
//  Created by Patil, Ganesh on 07/02/22.
//

import UIKit

class LoginViewController: UIViewController, CoordinatorBoard {

    weak var mainCoordinator: LoginCoordinator?
    @IBOutlet weak var userNameTestFiled: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
    }

    @IBAction func openResetPasswordVCAction(_ sender: Any) {
        mainCoordinator?.configureResetPasswordVC()
    }

    @IBAction func performLoginAction(_ sender: Any) {
        let name: String = userNameTestFiled.text ?? ""
        mainCoordinator?.configureHomeVC(userName: name)
    }
}

