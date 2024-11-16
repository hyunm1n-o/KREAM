//
//  BottomView.swift
//  KREAM
//
//  Created by 오현민 on 11/2/24.
//


import UIKit

class DetailBottomView: BottomView {
    private lazy var scrapButton = UIButton().then {
        var config = UIButton.Configuration.plain()
        config.baseBackgroundColor = .clear
        config.baseForegroundColor = .black
        
        config.image = UIImage(named: "KREAM-saved-3")
        
        $0.configuration = config
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private lazy var scrapLabel = UILabel().then {
        $0.text = "2,122"
        $0.font = UIFont.systemFont(ofSize: 12)
        $0.textColor = .black
        $0.textAlignment = .center
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    public lazy var purchaseButton = UIButton().then {
        var config = UIButton.Configuration.filled()
        config.attributedTitle = AttributedString("구매", attributes: titleContainer)
        config.baseBackgroundColor = .EF_6254
        config.baseForegroundColor = .white
        config.cornerStyle = .medium
        
        $0.configuration = config
        $0.contentHorizontalAlignment = .leading
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private lazy var purchasePriceLabel = UILabel().then {
        $0.text = "345,000"
        $0.font = UIFont.systemFont(ofSize: 13, weight: .bold)
        $0.textColor = .white
        $0.textAlignment = .left
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private lazy var instantPurchaseLabel = UILabel().then {
        $0.text = "즉시 구매가"
        $0.font = UIFont.systemFont(ofSize: 10)
        $0.textColor = .A_33723
        $0.textAlignment = .left
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private lazy var sellingButton = UIButton().then {
        var config = UIButton.Configuration.filled()
        config.attributedTitle = AttributedString("판매", attributes: titleContainer)
        config.baseBackgroundColor = ._41_B_97_A
        config.baseForegroundColor = .white
        config.cornerStyle = .medium
        
        $0.configuration = config
        $0.contentHorizontalAlignment = .leading
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private lazy var sellingPriceLabel = UILabel().then {
        $0.text = "345,000"
        $0.font = UIFont.systemFont(ofSize: 13, weight: .bold)
        $0.textColor = .white
        $0.textAlignment = .left
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private lazy var instantSellingLabel = UILabel().then {
        $0.text = "즉시 구매가"
        $0.font = UIFont.systemFont(ofSize: 10)
        $0.textColor = ._1_F_7745
        $0.textAlignment = .left
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
    
    override func setStackView() {
        buttonStackView.addArrangedSubview(purchaseButton)
        buttonStackView.addArrangedSubview(sellingButton)
    }
    
    override func setView() {
        super.setView()
        self.addSubview(scrapButton)
        self.addSubview(scrapLabel)
        
        purchaseButton.addSubview(purchasePriceLabel)
        purchaseButton.addSubview(instantPurchaseLabel)
        
        sellingButton.addSubview(sellingPriceLabel)
        sellingButton.addSubview(instantSellingLabel)
    }
    
    override func setConstraints() {
        scrapButton.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(17)
            $0.top.equalToSuperview().inset(12)
            $0.width.height.equalTo(26)
        }
        
        scrapLabel.snp.makeConstraints {
            $0.top.equalTo(scrapButton.snp.bottom)
            $0.centerX.equalTo(scrapButton)
        }
        
        buttonStackView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(8)
            $0.leading.equalTo(scrapButton.snp.trailing).offset(19)
            $0.trailing.equalToSuperview().inset(10)
        }
        
        purchaseButton.snp.makeConstraints {
            $0.height.equalTo(49)
        }
        
        purchasePriceLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(8)
            $0.leading.equalToSuperview().inset(59)
        }
        
        instantPurchaseLabel.snp.makeConstraints {
            $0.top.equalTo(purchasePriceLabel.snp.bottom).offset(2)
            $0.leading.equalToSuperview().inset(59)
        }
        
        sellingButton.snp.makeConstraints {
            $0.height.equalTo(49)
        }
        
        sellingPriceLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(8)
            $0.leading.equalToSuperview().inset(59)
        }
        
        instantSellingLabel.snp.makeConstraints {
            $0.top.equalTo(sellingPriceLabel.snp.bottom).offset(2)
            $0.leading.equalToSuperview().inset(59)
        }
    }
}
