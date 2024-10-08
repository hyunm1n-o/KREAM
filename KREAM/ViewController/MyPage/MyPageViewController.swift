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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addView()
        setUpNavigationBarItem()
    }
    
    private func setUpNavigationBarItem() {
        let backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
        self.navigationItem.backBarButtonItem = backBarButtonItem
    }
    
    private lazy var myPageView = MyPageView().then {
        $0.profileManageButton.addTarget(self, action: #selector(profileManageButtonTapped), for: .touchUpInside)
    }
    
    @objc
    private func profileManageButtonTapped() {
        let ProfileManageVC = ProfileManageViewController()
        
        navigationController?.pushViewController(ProfileManageVC, animated: true)
    }
    
    private func addView() {
        
        view.addSubview(myPageView)
        
        myPageView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.width.equalTo(328)
            make.height.equalTo(193)
            make.centerX.equalToSuperview()
        }
    }

}
