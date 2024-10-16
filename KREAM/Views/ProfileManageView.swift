//
//  ProfileManageView.swift
//  KREAM
//
//  Created by 오현민 on 9/27/24.
//

import UIKit
import Then
import SnapKit

class ProfileManageView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        addComponents()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public lazy var profileImageView = UIImageView().then {
        $0.image = UIImage(named: "KREAM-profileImage")
        $0.contentMode = .scaleAspectFill
        
        $0.layer.cornerRadius = 45
        $0.clipsToBounds = true
    }
    
    public lazy var infoView = UIView()
    
    public lazy var profileInfoLabel = UILabel().then {
        $0.text = "프로필 정보"
        $0.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        $0.textAlignment = .left
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    public lazy var userEmailLabel = UILabel().then {
        $0.text = "유저 이메일"
        $0.font = UIFont.systemFont(ofSize: 14)
        $0.textAlignment = .left
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    public lazy var userPwdLabel = UILabel().then {
        $0.text = "유저 비밀번호"
        $0.font = UIFont.systemFont(ofSize: 14)
        $0.textAlignment = .left
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    public lazy var userEmailTextField = UITextField().then {
        $0.textAlignment = .left
        $0.font = UIFont.systemFont(ofSize: 14)
        $0.placeholder = "새로운 이메일을 입력해 주세요!"
        $0.setPlaceholderColor(.placeholderGray)
        
        $0.layer.cornerRadius = 10
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.buttonGray.cgColor
        
        $0.leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 11.0, height: 0.0))
        $0.leftViewMode = .always
        
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
     public lazy var userPwdTextField = UITextField().then {
        $0.textAlignment = .left
        $0.font = UIFont.systemFont(ofSize: 14)
        $0.placeholder = "새로운 비밀번호를 입력해 주세요!"
        $0.setPlaceholderColor(.placeholderGray)
        
        $0.layer.cornerRadius = 10
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.buttonGray.cgColor
         
         $0.leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 11.0, height: 0.0))
         $0.leftViewMode = .always
        
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private lazy var titleContainer : AttributeContainer = {
        var container = AttributeContainer()
        container.font = UIFont.systemFont(ofSize: 14)
        container.foregroundColor = UIColor.black
        
        return container
    }()
    
    public lazy var userEmailChangeButton = UIButton().then {
        var config = UIButton.Configuration.plain()
        
        config.attributedTitle = AttributedString("변경", attributes: titleContainer)
        config.titleAlignment = .center
        
        config.background.strokeWidth = 1
        config.background.strokeColor = .black
        
        config.cornerStyle = .large
        
        $0.configuration = config
        $0.translatesAutoresizingMaskIntoConstraints = false
        
        $0.isUserInteractionEnabled = true
    }
    
   public lazy var userPwdChangeButton = UIButton().then {
        var config = UIButton.Configuration.plain()
        
        config.attributedTitle = AttributedString("변경", attributes: titleContainer)
        config.titleAlignment = .center
        
        config.background.strokeWidth = 1
        config.background.strokeColor = .black
        
        config.cornerStyle = .large
        
        $0.configuration = config
        $0.translatesAutoresizingMaskIntoConstraints = false
       
       $0.isUserInteractionEnabled = true
    }
    
    private func addComponents() {
        self.addSubview(profileImageView)
        self.addSubview(infoView)
        
        infoView.addSubview(profileInfoLabel)
        
        infoView.addSubview(userEmailLabel)
        infoView.addSubview(userEmailTextField)
        infoView.addSubview(userEmailChangeButton)
        
        infoView.addSubview(userPwdLabel)
        infoView.addSubview(userPwdTextField)
        infoView.addSubview(userPwdChangeButton)
        
        profileImageView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(self.safeAreaLayoutGuide).inset(52)
            $0.width.height.equalTo(90)
        }

        infoView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(profileImageView.snp.bottom).offset(20)
            $0.width.equalTo(349)
            $0.height.equalTo(191)
        }

        profileInfoLabel.snp.makeConstraints {
            $0.top.leading.equalToSuperview()
        }

        userEmailLabel.snp.makeConstraints {
            $0.top.equalTo(profileInfoLabel.snp.bottom).offset(23)
            $0.leading.equalToSuperview()
        }

        userEmailTextField.snp.makeConstraints {
            $0.top.equalTo(userEmailLabel.snp.bottom).offset(4)
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview().inset(67)
            $0.height.equalTo(32)
        }

        userEmailChangeButton.snp.makeConstraints {
            $0.top.equalTo(userEmailLabel.snp.bottom).offset(4)
            $0.trailing.equalToSuperview()
            $0.width.equalTo(58)
            $0.height.equalTo(32)
        }

        userPwdLabel.snp.makeConstraints {
            $0.top.equalTo(userEmailTextField.snp.bottom).offset(23)
            $0.leading.equalToSuperview()
        }

        userPwdTextField.snp.makeConstraints {
            $0.top.equalTo(userPwdLabel.snp.bottom).offset(4)
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview().inset(67)
            $0.height.equalTo(32)
        }

        userPwdChangeButton.snp.makeConstraints {
            $0.top.equalTo(userPwdLabel.snp.bottom).offset(4)
            $0.trailing.equalToSuperview()
            $0.width.equalTo(58)
            $0.height.equalTo(32)
        }

        
        
    }
}
