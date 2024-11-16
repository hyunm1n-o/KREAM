//
//  DivideLineView.swift
//  KREAM
//
//  Created by 오현민 on 10/16/24.
//

import UIKit

class DivideLineView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        self.backgroundColor = .F_2_F_2_F_2
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
