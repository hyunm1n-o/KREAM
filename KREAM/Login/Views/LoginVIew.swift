//
//  LoginVIew.swift
//  KREAM
//
//  Created by 오현민 on 9/23/24.
//

import UIKit
import Then
import SnapKit

class LoginView: UIView {

    public lazy var logoImageView: UIImageView = UIImageView().then {
        $0.image = UIImage(named: "KREAM-logo")
        $0.contentMode = .scaleAspectFill
    }

    public lazy var IDLabel: UILabel = UILabel().then {
        $0.font = UIFont.systemFont(ofSize: 12)
        $0.textColor = UIColor.black
        $0.text = "이메일 주소"
        $0.textAlignment = .left
        $0.translatesAutoresizingMaskIntoConstraints = false
    }

    public lazy var pwdLabel: UILabel = UILabel().then {
        $0.font = UIFont.systemFont(ofSize: 12)
        $0.textColor = UIColor.black
        $0.text = "비밀번호"
        $0.textAlignment = .left
        $0.translatesAutoresizingMaskIntoConstraints = false
    }

    public lazy var IDTextField: UITextField = UITextField().then {
        $0.textAlignment = .left
        $0.font = UIFont.systemFont(ofSize: 12)
        $0.placeholder = "예) kream@kream.co.kr"
        $0.setPlaceholderColor(.placeholderGray)
        
        $0.layer.cornerRadius = 15
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.tfGray.cgColor
        
        $0.leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 16.0, height: 0.0))
        $0.leftViewMode = .always
        
        $0.translatesAutoresizingMaskIntoConstraints = false
    }

    public lazy var pwdTextField: UITextField = UITextField().then {
        $0.textAlignment = .left
        $0.font = UIFont.systemFont(ofSize: 12)
        $0.placeholder = "비밀번호를 입력해주세요"
        $0.setPlaceholderColor(.placeholderGray)
        
        $0.layer.cornerRadius = 15
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.tfGray.cgColor
        
        $0.leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 16.0, height: 0.0))
        $0.leftViewMode = .always
        
        $0.translatesAutoresizingMaskIntoConstraints = false
    }

    public lazy var loginButton: UIButton = UIButton().then {
        var config = UIButton.Configuration.filled()
        
        config.baseBackgroundColor = .buttonGray
        config.title = "로그인"
        config.titleAlignment = .center
        config.cornerStyle = .large
        
        $0.configuration = config
        $0.translatesAutoresizingMaskIntoConstraints = false
    }

    private lazy var titleContainer: AttributeContainer = {
        var container = AttributeContainer()
        container.font = UIFont.systemFont(ofSize: 13, weight: .bold)
        container.foregroundColor = UIColor.black
        return container
    }()

    public lazy var kakaoLoginButton: UIButton = UIButton().then {
        let leftImageView = UIImageView(image: UIImage(named: "KREAM-kakao"))
        $0.addSubview(leftImageView)
        leftImageView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(17)
        }
        
        var config = UIButton.Configuration.plain()
        config.attributedTitle = AttributedString("카카오로 로그인", attributes: titleContainer)
        config.titleAlignment = .center
        config.background.strokeWidth = 1
        config.background.strokeColor = .buttonGray
        config.cornerStyle = .large
        
        $0.configuration = config
        $0.translatesAutoresizingMaskIntoConstraints = false
    }

    public lazy var appleLoginButton: UIButton = UIButton().then {
        let leftImageView = UIImageView(image: UIImage(named: "KREAM-apple"))
        $0.addSubview(leftImageView)
        leftImageView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(17)
        }
        
        var config = UIButton.Configuration.plain()
        config.attributedTitle = AttributedString("Apple로 로그인", attributes: titleContainer)
        config.titleAlignment = .center
        config.background.strokeWidth = 1
        config.background.strokeColor = .buttonGray
        config.cornerStyle = .large
        
        $0.configuration = config
        $0.translatesAutoresizingMaskIntoConstraints = false
    }

    //MARK: - 화면 설정
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        self.addComponents()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addComponents() {
        self.addSubview(logoImageView)
        self.addSubview(IDLabel)
        self.addSubview(pwdLabel)
        self.addSubview(IDTextField)
        self.addSubview(pwdTextField)
        self.addSubview(loginButton)
        self.addSubview(kakaoLoginButton)
        self.addSubview(appleLoginButton)
        
        logoImageView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().inset(126)
            $0.width.equalTo(287)
            $0.height.equalTo(75)
        }

        IDLabel.snp.makeConstraints {
            $0.top.equalTo(logoImageView.snp.bottom).offset(87)
            $0.leading.trailing.equalToSuperview().inset(45)
        }

        pwdLabel.snp.makeConstraints {
            $0.top.equalTo(IDTextField.snp.bottom).offset(17)
            $0.leading.trailing.equalToSuperview().inset(45)
        }

        IDTextField.snp.makeConstraints {
            $0.top.equalTo(IDLabel.snp.bottom).offset(8)
            $0.leading.trailing.equalToSuperview().inset(45)
            $0.height.equalTo(34)
        }

        pwdTextField.snp.makeConstraints {
            $0.top.equalTo(pwdLabel.snp.bottom).offset(8)
            $0.leading.trailing.equalToSuperview().inset(45)
            $0.height.equalTo(34)
        }

        loginButton.snp.makeConstraints {
            $0.top.equalTo(pwdTextField.snp.bottom).offset(17)
            $0.leading.trailing.equalToSuperview().inset(45)
            $0.height.equalTo(38)
        }

        kakaoLoginButton.snp.makeConstraints {
            $0.top.equalTo(loginButton.snp.bottom).offset(87)
            $0.leading.trailing.equalToSuperview().inset(45)
            $0.height.equalTo(40)
        }

        appleLoginButton.snp.makeConstraints {
            $0.top.equalTo(kakaoLoginButton.snp.bottom).offset(22)
            $0.leading.trailing.equalToSuperview().inset(45)
            $0.height.equalTo(40)
        }

    }
}
