//
//  RecommendCell.swift
//  KREAM
//
//  Created by 오현민 on 11/23/24.
//

import UIKit

class RecommendCell: UICollectionViewCell {
    static let identifier = "RecommendCell"
 
    public lazy var titleLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 13.5, weight: .light)
        $0.textColor = .black
        $0.textAlignment = .center
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private lazy var view = UILabel().then
    
    //MARK: - 화면 설정
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setView()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setView() {
        contentView.backgroundColor = .F_6_F_6_F_6
        contentView.layer.cornerRadius = 18
        contentView.layer.borderWidth = 1
        contentView.layer.borderColor = UIColor.ECECEC.cgColor
        
        contentView.addSubview(titleLabel)
    }
    
    private func setConstraints() {
        titleLabel.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(11)
            $0.top.bottom.equalToSuperview().inset(8)
        }
    }
    
    //MARK: - 너비 설정
    static func fittingSize(availableHeight: CGFloat, name: String?) -> CGSize {
        let cell = RecommendCell()
        cell.configure(name: name)
        
        let targetSize = CGSize(width: UIView.layoutFittingCompressedSize.width, height: availableHeight)
        
        let size = cell.contentView.systemLayoutSizeFitting(
            targetSize,
            withHorizontalFittingPriority: .fittingSizeLevel,
            verticalFittingPriority: .required
        )
        return CGSize(width: size.width, height: availableHeight)
    }

    
    func configure(name: String?) {
        titleLabel.text = name
    }
}
