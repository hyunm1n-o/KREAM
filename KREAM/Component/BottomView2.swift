//
//  BottomView.swift
//  KREAM
//
//  Created by 오현민 on 11/2/24.
//


import UIKit

class BottomView2: UIView {
    
    private lazy var buttonStackView = UIStackView().then {
        $0.axis = .horizontal
        $0.distribution = .fillEqually
        $0.spacing = 6
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private lazy var titleContainer: AttributeContainer = {
        var container = AttributeContainer()
        container.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        container.foregroundColor = .white
        return container
    }()
    
    private lazy var quickSubtitleContainer: AttributeContainer = {
        var container = AttributeContainer()
        container.font = UIFont.systemFont(ofSize: 10, weight: .light)
        container.foregroundColor = .FFCAB_9
        return container
    }()
    
    private lazy var standardSubtitleContainer: AttributeContainer = {
        var container = AttributeContainer()
        container.font = UIFont.systemFont(ofSize: 10, weight: .light)
        container.foregroundColor = .E_2_E_2_E_2
        return container
    }()
    
    public lazy var quickDeliveryButton = UIButton().then {
        var config = UIButton.Configuration.filled()
        config.attributedTitle = AttributedString("345,000", attributes: titleContainer)
        config.attributedSubtitle = AttributedString("빠른배송(1-2일 소요)", attributes: quickSubtitleContainer)
        config.titleAlignment = .center
        config.baseBackgroundColor = .EF_6254
        config.cornerStyle = .medium
        
        $0.configuration = config
        $0.contentHorizontalAlignment = .center
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private lazy var standardDeliveryButton = UIButton().then {
        var config = UIButton.Configuration.filled()
        config.attributedTitle = AttributedString("407,000", attributes: titleContainer)
        config.attributedSubtitle = AttributedString("일반배송(5-7일 소요)", attributes: standardSubtitleContainer)
        config.titleAlignment = .center
        config.baseBackgroundColor = .black
        config.cornerStyle = .medium
        
        $0.configuration = config
        $0.contentHorizontalAlignment = .center
        $0.translatesAutoresizingMaskIntoConstraints = false
    }

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
    
    private func setStackView() {
        buttonStackView.addArrangedSubview(quickDeliveryButton)
        buttonStackView.addArrangedSubview(standardDeliveryButton)
    }
    
    private func setView() {
        self.addSubview(buttonStackView)
    }
    
    private func setConstraints() {
    
        buttonStackView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(8)
            $0.horizontalEdges.equalToSuperview().inset(16)
        }
        
        quickDeliveryButton.snp.makeConstraints {
            $0.height.equalTo(49)
        }
        
        standardDeliveryButton.snp.makeConstraints {
            $0.height.equalTo(49)
        }
    }
}
