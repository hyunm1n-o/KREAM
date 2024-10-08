//
//  ProfileManageViewController.swift
//  KREAM
//
//  Created by 오현민 on 9/27/24.
//

import UIKit
import Then

class ProfileManageViewController: UIViewController {

    private var isEmailChangeButtonTapped = false
    private var isPwdChangeButtonTapped = false
    
    private let loginModel = LoginModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = profileManageView
        self.navigationItem.title = "프로필 관리"
        
        loadLoginValue()
    }
   
    private lazy var profileManageView = ProfileManageView().then {
        $0.userEmailChangeButton.addTarget(self, action: #selector(emailChangeButtonTapped), for: .touchUpInside)
        $0.userPwdChangeButton.addTarget(self, action: #selector(pwdChangeButtonTapped), for: .touchUpInside)
    }
    
    private lazy var titleContainer : AttributeContainer = {
        var container = AttributeContainer()
        container.font = UIFont.systemFont(ofSize: 14)
        container.foregroundColor = UIColor.black
        
        return container
    }()
    
    @objc
    private func emailChangeButtonTapped() {
        isEmailChangeButtonTapped = !isEmailChangeButtonTapped
        profileManageView.userEmailTextField.isUserInteractionEnabled = isEmailChangeButtonTapped
        
        let title = isEmailChangeButtonTapped ? "확인" : "변경"
        
        var config = UIButton.Configuration.plain()
        
        config.attributedTitle = AttributedString(title, attributes: titleContainer)
        config.titleAlignment = .center
        config.background.strokeWidth = 1
        config.background.strokeColor = .black
        config.cornerStyle = .large
        
        profileManageView.userEmailChangeButton.configuration = config
        
        guard let email = profileManageView.userEmailTextField.text, !email.isEmpty else {
            profileManageView.userEmailTextField.placeholder = "이메일을 작성 후 변경 버튼을 눌러주세요"
            profileManageView.userEmailTextField.setPlaceholderColor(.red)
            return
        }
        
        loginModel.saveUserEmail(email)
    }
    
    @objc
    private func pwdChangeButtonTapped() {
        isPwdChangeButtonTapped = !isPwdChangeButtonTapped
        profileManageView.userPwdTextField.isUserInteractionEnabled = isPwdChangeButtonTapped
        
        let title = isPwdChangeButtonTapped ? "확인" : "변경"
        
        var config = UIButton.Configuration.plain()
        
        config.attributedTitle = AttributedString(title, attributes: titleContainer)
        config.titleAlignment = .center
        config.background.strokeWidth = 1
        config.background.strokeColor = .black
        config.cornerStyle = .large
        
        profileManageView.userPwdChangeButton.configuration = config
        
        guard let pwd = profileManageView.userPwdTextField.text, !pwd.isEmpty else {
            profileManageView.userPwdTextField.placeholder = "비밀번호를 작성 후 변경 버튼을 눌러주세요"
            profileManageView.userPwdTextField.setPlaceholderColor(.red)
            return
        }
        
        loginModel.saveUserPwd(pwd)
    }
    
    private func loadLoginValue() {
        if let savedEmail = loginModel.loadUserEmail() {
            profileManageView.userEmailTextField.text = savedEmail
        }
        
        if let savedPwd = loginModel.loadUserPwd() {
            profileManageView.userPwdTextField.text = savedPwd
        }
    }

}
