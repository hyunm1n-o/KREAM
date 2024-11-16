//
//  ViewController.swift
//  KREAM
//
//  Created by 오현민 on 9/23/24.
//

import UIKit

class LoginViewController: UIViewController {

    private let loginModel = LoginModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = loginView
    }
    
    private lazy var loginView = LoginView().then {
        $0.loginButton.addTarget(self, action: #selector(LoginButtonTapped) , for: .touchUpInside)
    }

    @objc
    private func LoginButtonTapped() {
        guard let email = loginView.IDTextField.text, !email.isEmpty else { return }
        guard let pwd = loginView.pwdTextField.text, !pwd.isEmpty else { return }
                
        loginModel.saveUserEmail(email)
        loginModel.saveUserPwd(pwd)
        
        let BaseVC = BaseViewController()
        
        BaseVC.modalPresentationStyle = .fullScreen
        present(BaseVC, animated: true)
    }
}

