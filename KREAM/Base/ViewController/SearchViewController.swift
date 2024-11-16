//
//  SearchViewController.swift
//  KREAM
//
//  Created by 오현민 on 10/13/24.
//

import UIKit

class SearchViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        view.addSubview(searchLabel)
        searchLabel.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
    }
    
    private lazy var searchLabel = UILabel().then {
        $0.text = "검색창"
    }

}
