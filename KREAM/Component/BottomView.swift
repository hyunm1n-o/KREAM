//
//  BottomView.swift
//  KREAM
//
//  Created by 오현민 on 11/2/24.
//


import UIKit

class BottomView: UIView {

    lazy var buttonStackView = UIStackView().then {
        $0.axis = .horizontal
        $0.distribution = .fillEqually
        $0.spacing = 6
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    lazy var titleContainer: AttributeContainer = {
        var container = AttributeContainer()
        container.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        return container
    }()
    
    
    
    //MARK: - 화면 설정
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        
        setView()
        setConstraints()
        setStackView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setStackView() { }
    
    func setView() {
        self.addSubview(buttonStackView)
    }
    
    func setConstraints() { }
        
}
