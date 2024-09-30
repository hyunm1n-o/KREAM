//
//  ViewController.swift
//  KREAM
//
//  Created by 오현민 on 9/23/24.
//

import UIKit
import Then

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = loginView
    }
    
    private lazy var loginView = LoginView().then {
        $0.loginButton.addTarget(self, action: #selector(LoginButtonTapped) , for: .touchUpInside)
    }

    @objc
    private func LoginButtonTapped() {
        let BaseVC = BaseViewController()
        
        let navController = UINavigationController(rootViewController: BaseVC)
        
        navController.modalPresentationStyle = .fullScreen
        present(navController, animated: true)
    }
}

