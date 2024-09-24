//
//  LoginVIew.swift
//  KREAM
//
//  Created by 오현민 on 9/23/24.
//

import UIKit
import SnapKit

class LoginView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        self.addComponents()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    public lazy var logoImageView: UIImageView = {
        let imgView = UIImageView()
        
        imgView.image = UIImage(named: "KREAM-logo")
        imgView.contentMode = .scaleAspectFill
        
        return imgView
    }()
    
    public lazy var IDLabel : UILabel = {
        let label = UILabel()
        
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = UIColor.black
        label.text = "이메일 주소"
        label.textAlignment = .left
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    public lazy var pwdLabel : UILabel = {
        let label = UILabel()
        
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = UIColor.black
        label.text = "비밀번호"
        label.textAlignment = .left
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    public lazy var IDTextField : UITextField = {
        let tf = UITextField()
        
        tf.textAlignment = .left
        tf.font = UIFont.systemFont(ofSize: 12)
        tf.placeholder = "예) kream@kream.co.kr"
        tf.setPlaceholderColor(.placeholderGray)
        
        tf.layer.cornerRadius = 15
        tf.layer.borderWidth = 1
        tf.layer.borderColor = UIColor.tfGray.cgColor
        
        tf.leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 16.0, height: 0.0))
        tf.leftViewMode = .always
        
        tf.translatesAutoresizingMaskIntoConstraints = false
        
        return tf
    }()
    
    public lazy var pwdTextField : UITextField = {
        let tf = UITextField()
        
        tf.textAlignment = .left
        tf.font = UIFont.systemFont(ofSize: 12)
        tf.placeholder = "비밀번호를 입력해주세요"
        tf.setPlaceholderColor(.placeholderGray)
        
        tf.layer.cornerRadius = 15
        tf.layer.borderWidth = 1
        tf.layer.borderColor = UIColor.tfGray.cgColor
        
        tf.leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 16.0, height: 0.0))
        tf.leftViewMode = .always
        
        tf.translatesAutoresizingMaskIntoConstraints = false
        
        return tf
    }()
    

    
    public lazy var loginButton : UIButton = {
        let btn = UIButton()
        
        var config = UIButton.Configuration.filled()
        
        config.baseBackgroundColor = .buttonGray
        
        config.title = "로그인"
        config.titleAlignment = .center
        
        config.cornerStyle = .large
        
        btn.configuration = config
        btn.translatesAutoresizingMaskIntoConstraints = false
        
        return btn
        
    }()
    
    private lazy var titleContainer : AttributeContainer = {
        var container = AttributeContainer()
        container.font = UIFont.systemFont(ofSize: 13, weight: .bold)
        container.foregroundColor = UIColor.black
        
        return container
    }()
    
    public lazy var kakaoLoginButton : UIButton = {
        let btn = UIButton()
        
        let leftImageView = UIImageView(image: UIImage(named: "KREAM-kakao"))
        btn.addSubview(leftImageView)
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
        
        btn.configuration = config
        btn.translatesAutoresizingMaskIntoConstraints = false
        
        return btn
    }()
    
    public lazy var appleLoginButton : UIButton = {
        let btn = UIButton()
        
        let leftImageView = UIImageView(image: UIImage(named: "KREAM-apple"))
        btn.addSubview(leftImageView)
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
        
        btn.configuration = config
        btn.translatesAutoresizingMaskIntoConstraints = false
        
        return btn
    }()
    
    private func addComponents() {
        self.addSubview(logoImageView)
        self.addSubview(IDLabel)
        self.addSubview(pwdLabel)
        self.addSubview(IDTextField)
        self.addSubview(pwdTextField)
        self.addSubview(loginButton)
        self.addSubview(kakaoLoginButton)
        self.addSubview(appleLoginButton)
        
        logoImageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().inset(126)
            make.width.equalTo(287)
            make.height.equalTo(75)
        }
        
        IDLabel.snp.makeConstraints { make in
            make.top.equalTo(logoImageView.snp.bottom).offset(87)
            make.leading.trailing.equalToSuperview().inset(45)
        }
        
        pwdLabel.snp.makeConstraints { make in
            make.top.equalTo(IDTextField.snp.bottom).offset(17)
            make.leading.trailing.equalToSuperview().inset(45)
        }
        
        IDTextField.snp.makeConstraints { make in
            make.top.equalTo(IDLabel.snp.bottom).offset(8)
            make.leading.trailing.equalToSuperview().inset(45)
            make.height.equalTo(34)
        }
        
        pwdTextField.snp.makeConstraints { make in
            make.top.equalTo(pwdLabel.snp.bottom).offset(8)
            make.leading.trailing.equalToSuperview().inset(45)
            make.height.equalTo(34)
        }
        
        loginButton.snp.makeConstraints { make in
            make.top.equalTo(pwdTextField.snp.bottom).offset(17)
            make.leading.trailing.equalToSuperview().inset(45)
            make.height.equalTo(38)
        }
        
        kakaoLoginButton.snp.makeConstraints { make in
            make.top.equalTo(loginButton.snp.bottom).offset(87)
            make.leading.trailing.equalToSuperview().inset(45)
            make.height.equalTo(40)
        }
        
        appleLoginButton.snp.makeConstraints { make in
            make.top.equalTo(kakaoLoginButton.snp.bottom).offset(22)
            make.leading.trailing.equalToSuperview().inset(45)
            make.height.equalTo(40)
        }
    }
}
