//
//  SizeCell.swift
//  KREAM
//
//  Created by 오현민 on 11/2/24.
//

import UIKit

class SizeCell: UICollectionViewCell {
    static let identifier = "SizeCell"

    public lazy var sizeView = UIView().then {
        $0.layer.cornerRadius = 10
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.F_2_F_2_F_2.cgColor
        $0.isUserInteractionEnabled = false
    }
    
    public lazy var sizeLabel = UILabel().then {
        $0.font = UIFont.systemFont(ofSize: 14)
        $0.textColor = .black
        $0.textAlignment = .center
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    public lazy var priceLabel = UILabel().then {
        $0.text = "360,000"
        $0.font = UIFont.systemFont(ofSize: 12)
        $0.textColor = .D_95_A_5_D
        $0.textAlignment = .center
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    //MARK: - 기능
    override var isSelected: Bool {
        didSet{
            if isSelected {
                sizeView.layer.borderColor = UIColor.black.cgColor
                sizeLabel.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
                priceLabel.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
            }
            else {
                sizeView.layer.borderColor = UIColor.F_2_F_2_F_2.cgColor
                sizeLabel.font = UIFont.systemFont(ofSize: 14)
                priceLabel.font = UIFont.systemFont(ofSize: 12)
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    //MARK: - 화면 설정
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        
        setView()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setView() {
        self.addSubview(sizeView)
        sizeView.addSubview(sizeLabel)
        sizeView.addSubview(priceLabel)
    }
    
    private func setConstraints() {
        sizeView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.width.equalTo(110)
            $0.height.equalTo(47)
        }
        
        sizeLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(8)
            $0.centerX.equalToSuperview()
        }
        
        priceLabel.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(8)
            $0.centerX.equalToSuperview()
        }
    }
    
}

