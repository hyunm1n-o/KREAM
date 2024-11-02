//
//  DetailCell.swift
//  KREAM
//
//  Created by 오현민 on 11/2/24.
//

import UIKit

class DetailCell: UICollectionViewCell {
    static let identifier = "DetailCell"
    
    public lazy var imageView = UIImageView().then {
        $0.contentMode = .scaleAspectFill
        $0.translatesAutoresizingMaskIntoConstraints = false
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
    }
    
    private func setConstraints() {
        imageView.snp.makeConstraints {
            $0.width.height.equalTo(53)
            $0.edges.equalToSuperview()
        }
    }
}
