//
//  JustDroppedCell.swift
//  KREAM
//
//  Created by 오현민 on 10/15/24.
//

import UIKit
import Kingfisher

class JustDroppedCell: UICollectionViewCell {
    static let identifier = "JusutDroppedCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setView()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public lazy var imageView = UIImageView().then {
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 10
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private lazy var scrapButton = UIButton().then {
        var config = UIButton.Configuration.plain()
        config.image = UIImage(named: "KREAM-saved-2")
        config.baseBackgroundColor = .clear
        
        $0.configuration = config
        $0.addTarget(self, action: #selector(scrapButtonTapped), for: .touchUpInside)
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    public lazy var transactionsLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 10)
        $0.textColor = ._40454_B
        $0.textAlignment = .right
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    public lazy var brandLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 12, weight: .bold)
        $0.textColor = .black
        $0.textAlignment = .left
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    public lazy var productLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 12, weight: .light)
        $0.textColor = .black
        $0.textAlignment = .left
        $0.numberOfLines = 2
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    public lazy var priceLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 13, weight: .semibold)
        $0.textColor = .black
        $0.textAlignment = .left
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    public lazy var instantPriceLabel = UILabel().then {
        $0.text = "즉시 구매가"
        $0.font = .systemFont(ofSize: 10, weight: .light)
        $0.textColor = .A_2_A_2_A_2
        $0.textAlignment = .left
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    public func loadImage(from url: String) {
        if let imageURL = URL(string: url) {
            imageView.kf.setImage(with: imageURL)
        }
    }
    
    @objc
    private func scrapButtonTapped(_ sender: UIButton) {
        var config = UIButton.Configuration.plain()
        if sender.isSelected {
            sender.isSelected = false
            config.image = UIImage(named: "KREAM-saved-2")
        } else {
            sender.isSelected = true
            config.image = UIImage(named: "KREAM-saved-fill-2")
        }
        config.background.backgroundColor = .clear
        config.baseBackgroundColor = .clear
        sender.configuration = config
    }
    
    private func setView() {
        [
            imageView,
            scrapButton,
            transactionsLabel,
            brandLabel,
            productLabel,
            priceLabel,
            instantPriceLabel
        ].forEach { addSubview($0) }
    }
    
    private func setConstraints() {
        
        imageView.snp.makeConstraints {
            $0.horizontalEdges.top.equalToSuperview()
            $0.width.height.equalTo(142)
        }
        
        scrapButton.snp.makeConstraints {
            $0.bottom.equalTo(imageView.snp.bottom).offset(-10)
            $0.right.equalTo(imageView.snp.right).offset(-10)
            $0.width.equalTo(20)
            $0.height.equalTo(22)
        }
        
        transactionsLabel.snp.makeConstraints {
            $0.top.equalTo(imageView.snp.top).offset(8)
            $0.right.equalTo(imageView.snp.right).offset(-8)
        }
        
        brandLabel.snp.makeConstraints {
            $0.top.equalTo(imageView.snp.bottom).offset(8)
            $0.left.equalToSuperview().inset(4)
        }
    
        productLabel.snp.makeConstraints {
            $0.top.equalTo(brandLabel.snp.bottom).offset(3)
            $0.left.equalToSuperview().inset(4)
            $0.width.equalTo(124)
        }
        
        priceLabel.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(14)
            $0.left.equalToSuperview().inset(4)
        }
        
        instantPriceLabel.snp.makeConstraints {
            $0.bottom.equalToSuperview()
            $0.left.equalToSuperview().inset(4)
        }
        
    }
}
