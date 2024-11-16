//
//  MyPageView.swift
//  KREAM
//
//  Created by 오현민 on 9/26/24.
//

import UIKit
import Then
import SnapKit

class MyPageView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addComponents()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public lazy var infoView = UIView()
    
    public lazy var settingButton = UIButton().then {
        var config = UIButton.Configuration.plain()
        config.image = UIImage(named: "KREAM-setting")
        
        $0.configuration = config
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    public lazy var cameraButton = UIButton().then {
        var config = UIButton.Configuration.plain()
        config.image = UIImage(named: "KREAM-camera")
        
        $0.configuration = config
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    public lazy var profileImageView = UIImageView().then {
        $0.image = UIImage(named: "KREAM-profileImage")
        $0.contentMode = .scaleAspectFill
        
        $0.layer.cornerRadius = 45
        $0.clipsToBounds = true
    }
    
    public lazy var nicknameLabel = UILabel().then {
        $0.text = "햄민"
        $0.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        $0.textAlignment = .left
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    public lazy var followerLabel = UILabel().then {
        $0.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        $0.textAlignment = .left
        $0.translatesAutoresizingMaskIntoConstraints = false
        
        var follower = 36
        let fullText = "팔로워 \(follower)"
        let rangeText = (fullText as NSString).range(of: "팔로워")
        let fontSize = UIFont.systemFont(ofSize: 12)
    
        
        let attributedStr = NSMutableAttributedString(string: fullText)
        attributedStr.addAttribute(.font, value: fontSize, range: rangeText)
        $0.attributedText = attributedStr
    }

    public lazy var followingLabel = UILabel().then {
        $0.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        $0.textAlignment = .left
        $0.translatesAutoresizingMaskIntoConstraints = false
        
        var following = 20
        let fullText = "팔로잉 \(following)"
        let rangeText = (fullText as NSString).range(of: "팔로잉")
        let fontSize = UIFont.systemFont(ofSize: 12)
        
        
        let attributedStr = NSMutableAttributedString(string: fullText)
        attributedStr.addAttribute(.font, value: fontSize, range: rangeText)
        $0.attributedText = attributedStr
    }
    
    private lazy var titleContainer : AttributeContainer = {
        var container = AttributeContainer()
        container.font = UIFont.systemFont(ofSize: 9)
        container.foregroundColor = UIColor.black
        
        return container
    }()
    
    public lazy var profileManageButton = UIButton().then {
        var config = UIButton.Configuration.plain()
        
        config.attributedTitle = AttributedString("프로필 관리", attributes: titleContainer)
        config.titleAlignment = .center
        
        config.background.strokeWidth = 1
        config.background.strokeColor = .buttonGray
        
        config.cornerStyle = .large
        
        $0.configuration = config
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    public lazy var profileShareButton = UIButton().then {
        var config = UIButton.Configuration.plain()
        
        config.attributedTitle = AttributedString("프로필 공유", attributes: titleContainer)
        config.titleAlignment = .center
        
        config.background.strokeWidth = 1
        config.background.strokeColor = .buttonGray
        
        config.cornerStyle = .large
        
        $0.configuration = config
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func addComponents() {
        self.addSubview(settingButton)
        self.addSubview(cameraButton)
        self.addSubview(profileImageView)
        self.addSubview(infoView)
        
        infoView.addSubview(nicknameLabel)
        infoView.addSubview(followerLabel)
        infoView.addSubview(followingLabel)
        
        self.addSubview(profileManageButton)
        self.addSubview(profileShareButton)
        
        settingButton.snp.makeConstraints {
            $0.top.leading.equalToSuperview()
            $0.width.height.equalTo(25)
        }

        cameraButton.snp.makeConstraints {
            $0.top.trailing.equalToSuperview()
            $0.width.height.equalTo(25)
        }

        profileImageView.snp.makeConstraints {
            $0.top.equalTo(settingButton.snp.bottom).offset(26)
            $0.leading.equalToSuperview()
            $0.width.height.equalTo(90)
        }

        infoView.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.width.equalTo(115)
            $0.height.equalTo(48)
        }

        nicknameLabel.snp.makeConstraints {
            $0.top.leading.equalToSuperview()
        }

        followerLabel.snp.makeConstraints {
            $0.bottom.leading.equalToSuperview()
        }

        followingLabel.snp.makeConstraints {
            $0.bottom.equalToSuperview()
            $0.leading.equalTo(followerLabel.snp.trailing).offset(8)
        }

        profileManageButton.snp.makeConstraints {
            $0.bottom.leading.equalToSuperview()
            $0.width.equalTo(157)
            $0.height.equalTo(26)
        }

        profileShareButton.snp.makeConstraints {
            $0.bottom.trailing.equalToSuperview()
            $0.width.equalTo(157)
            $0.height.equalTo(26)
        }

    }
}
