//
//  SavedCell.swift
//  KREAM
//
//  Created by 오현민 on 10/9/24.
//

import UIKit
import SnapKit
import Then

class SavedCell: UITableViewCell {

    static let identifier = "SavedCell"
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setView()
        setConstaints()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure(model: SavedModel) {
        self.savedImageView.image = UIImage(named: model.savedImage)
        self.titleLabel.text = model.savedTitle
        self.descLabel.text = model.savedDesc
        self.descLabel.setLineSpacing(lineSpacing: 3.3)
        self.priceLabel.text = model.savedPrice
    }
    
    //MARK: - 컴포넌트 설정
    private lazy var savedImageView = UIImageView().then {
        $0.contentMode = .scaleAspectFill
    }
    
    private lazy var labelContainer = UIView()
    
    private lazy var titleLabel = UILabel().then {
        $0.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
        $0.textColor = .black
        $0.textAlignment = .left
    }
    
    private lazy var descLabel = UILabel().then {
        $0.font = UIFont.systemFont(ofSize: 9)
        $0.textColor = .systemGray
        $0.textAlignment = .left
        $0.numberOfLines = 2
        //$0.setLineSpacing(lineSpacing: 100)
    }
    
    private lazy var priceLabel = UILabel().then {
        $0.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        $0.textColor = .black
        $0.textAlignment = .right
    }
    
    private lazy var savedIconImageView = UIImageView().then {
        $0.image = UIImage(named: "KREAM-saved-fill")
        $0.contentMode = .scaleAspectFill
    }
    
    private func setView() {
        self.addSubview(savedImageView)
        self.addSubview(labelContainer)
        
        labelContainer.addSubview(titleLabel)
        labelContainer.addSubview(descLabel)
        
        self.addSubview(priceLabel)
        self.addSubview(savedIconImageView)
    }
    
    private func setConstaints() {
        savedImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(13)
            make.leading.equalToSuperview().inset(13)
            make.width.height.equalTo(72)
        }
        
        labelContainer.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(13)
            make.leading.equalTo(savedImageView.snp.trailing).offset(13)
            make.width.equalTo(153)
            make.height.equalTo(54)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(19)
        }
        
        descLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom)
            make.leading.trailing.equalToSuperview()
        }
        
        priceLabel.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(16)
            make.bottom.equalToSuperview().inset(10)
        }
        
        savedIconImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(18)
            make.trailing.equalToSuperview().inset(17)
            make.width.equalTo(14)
            make.height.equalTo(18)
        }
    }
}
