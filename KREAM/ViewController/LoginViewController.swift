//
//  ViewController.swift
//  KREAM
//
//  Created by 오현민 on 9/23/24.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = loginView
    }

    private lazy var loginView : LoginView = {
        let view = LoginView()
        
        return view
    }()

}

