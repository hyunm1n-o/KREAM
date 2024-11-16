//
//  ColdWaveCell.swift
//  KREAM
//
//  Created by 오현민 on 10/16/24.
//

import UIKit

class ColdWaveCell: UICollectionViewCell {
    static let identifier = "ColdWaveCell"
    
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
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    public lazy var instaIDLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 12)
        $0.textColor = .white
        $0.textAlignment = .left
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setView() {
        self.addSubview(imageView)
        self.addSubview(instaIDLabel)
    }
    
    private func setConstraints() {
        imageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.width.equalTo(124)
            $0.height.equalTo(165)
        }
        
        instaIDLabel.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(11)
            $0.left.equalToSuperview().inset(10)
        }
    }
}
