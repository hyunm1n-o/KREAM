//
//  ProfileManageViewController.swift
//  KREAM
//
//  Created by 오현민 on 9/27/24.
//

import UIKit

class ProfileManageViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = profileManageView
        self.navigationItem.title = "프로필 관리"
    }
   
    private lazy var profileManageView = ProfileManageView()

}
