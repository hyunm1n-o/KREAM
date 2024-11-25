//
//  ViewController.swift
//  KREAM
//
//  Created by 오현민 on 9/23/24.
//

import UIKit
import KakaoSDKUser

class LoginViewController: UIViewController {

    private let loginModel = LoginModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = loginView
    }
    
    private lazy var loginView = LoginView().then {
        $0.loginButton.addTarget(self, action: #selector(LoginButtonTapped) , for: .touchUpInside)
        $0.kakaoLoginButton.addTarget(self, action: #selector(kakaoLoginButtonTapped), for: .touchUpInside)
    }

    @objc
    private func LoginButtonTapped() {
        guard let email = loginView.IDTextField.text, !email.isEmpty else { return }
        guard let pwd = loginView.pwdTextField.text, !pwd.isEmpty else { return }
                
        loginModel.saveUserEmail(email)
        loginModel.saveUserPwd(pwd)
        
        successLogin()
    }
    
    @objc
    private func kakaoLoginButtonTapped() {
        //isKakaoTalkLoginAvailable() : 카톡 설치 되어있으면 true
        if (UserApi.isKakaoTalkLoginAvailable()) {
            
            //카톡 설치되어있으면 -> 카톡으로 로그인
            UserApi.shared.loginWithKakaoTalk {(oauthToken, error) in
                if let error = error {
                    print(error)
                } else {
                    print("카카오톡으로 로그인 성공")
                    
                    _ = oauthToken
                    /// 로그인 관련 메소드 추가
                }
            }
        } else {

            // 카톡 없으면 -> 계정으로 로그인
            UserApi.shared.loginWithKakaoAccount { (oauthToken, error) in
                if let error = error {
                    print(error)
                } else {
                    print("카카오 계정으로 로그인 성공")
                    
                    _ = oauthToken
                    // 관련 메소드 추가
                    self.setUserInfo()
                    self.successLogin()
                }
            }
        }
    }
    
    func setUserInfo() {
           UserApi.shared.me {(user, error) in
               if let error = error {
                   print(error)
               } else {
                   self.loginModel.saveUserName(user?.kakaoAccount?.profile?.nickname ?? "카카오 이름 불러오기 실패")
               }
           }
       }
    
    private func successLogin() {
        let BaseVC = BaseViewController()
        
        BaseVC.modalPresentationStyle = .fullScreen
        present(BaseVC, animated: true)
    }
}
