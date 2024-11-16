//
//  HomeCell.swift
//  KREAM
//
//  Created by 오현민 on 10/13/24.
//

import UIKit

class HomeCell: UICollectionViewCell {
    static let identifier = "HomeCell"
    
    public lazy var imageView = UIImageView().then {
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    public lazy var titleLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 11.5, weight: .light)
        $0.textColor = .black
        $0.textAlignment = .center
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setView()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setView() {
        addSubview(imageView)
        addSubview(titleLabel)
    }
    
    private func setConstraints() {
        imageView.snp.makeConstraints {
            $0.width.height.equalTo(61)
            $0.top.horizontalEdges.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(imageView.snp.bottom).offset(6)
        }
    }
}
