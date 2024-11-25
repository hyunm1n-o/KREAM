//
//  MyPageViewController.swift
//  KREAM
//
//  Created by 오현민 on 9/26/24.
//

import UIKit
import Then
import SnapKit

class MyPageViewController: UIViewController {
    
    private let loginModel = LoginModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addView()
        setUpNavigationBarItem()
        
        loadProfileValue()
    }
    
    ///View
    private lazy var myPageView = MyPageView().then {
        $0.profileManageButton.addTarget(self, action: #selector(profileManageButtonTapped), for: .touchUpInside)
    }
    
    // 기능
    private func loadProfileValue() {
        if let userName = loginModel.loadUserName() {
            myPageView.nicknameLabel.text = userName
        }
    }
    
    private func setUpNavigationBarItem() {
        let backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
        self.navigationItem.backBarButtonItem = backBarButtonItem
    }
    
    @objc
    private func profileManageButtonTapped() {
        let ProfileManageVC = ProfileManageViewController()
        
        navigationController?.pushViewController(ProfileManageVC, animated: true)
    }
    
    private func addView() {
        
        view.addSubview(myPageView)
        
        myPageView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.width.equalTo(328)
            $0.height.equalTo(193)
            $0.centerX.equalToSuperview()
        }
    }

}
