//
//  PurchaseView.swift
//  KREAM
//
//  Created by 오현민 on 11/1/24.
//

import UIKit

class PurchaseView: UIView {
    public lazy var cancleButton = UIButton().then {
        var config = UIButton.Configuration.plain()
        config.baseBackgroundColor = .clear
        config.baseForegroundColor = .black
        
        config.image = UIImage(named: "X")
        
        $0.configuration = config
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private lazy var titleLabel = UILabel().then {
        $0.text = "구매하기"
        $0.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        $0.textColor = .black
        $0.textAlignment = .center
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private lazy var subtitleLabel = UILabel().then {
        $0.text = "(가격 단위: 원)"
        $0.font = UIFont.systemFont(ofSize: 10)
        $0.textColor = ._929292
        $0.textAlignment = .center
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private lazy var imageView = UIImageView().then {
        $0.image = UIImage(named: "justDropped4")
        $0.contentMode = .scaleAspectFill
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private lazy var productLabel = UILabel().then {
        $0.text = "Matin Kim Logo Coating Jumper"
        $0.font = .systemFont(ofSize: 14)
        $0.textColor = .black
        $0.textAlignment = .left
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private lazy var descLabel = UILabel().then {
        $0.text = "마뗑킴 로고 코딩 점퍼 블랙"
        $0.font = .systemFont(ofSize: 12)
        $0.textColor = ._9_C_9_C_9_C
        $0.textAlignment = .left
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    public lazy var sizeCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout().then {
        $0.estimatedItemSize = .init(width: 110, height: 47)
        $0.minimumLineSpacing = 8
        $0.minimumInteritemSpacing = 7
    }).then {
        $0.isScrollEnabled = false
        $0.allowsSelection = true
        $0.register(SizeCell.self, forCellWithReuseIdentifier: SizeCell.identifier)
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private lazy var divideLine = DivideLineView().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    public lazy var bottomView = BottomView2().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
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
        self.addSubview(cancleButton)
        self.addSubview(titleLabel)
        self.addSubview(subtitleLabel)
        self.addSubview(imageView)
        self.addSubview(productLabel)
        self.addSubview(descLabel)
        self.addSubview(sizeCollectionView)
        
        self.addSubview(divideLine)
        self.addSubview(bottomView)
    }
    
    private func setConstraints() {
        cancleButton.snp.makeConstraints {
            $0.top.equalToSuperview().inset(20)
            $0.trailing.equalToSuperview().inset(16)
            $0.width.height.equalTo(20)
        }
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(20)
            $0.centerX.equalToSuperview()
        }
        subtitleLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom)
            $0.centerX.equalToSuperview()
        }
        imageView.snp.makeConstraints {
            $0.top.equalTo(subtitleLabel.snp.bottom).offset(11)
            $0.leading.equalToSuperview().inset(16)
            $0.width.height.equalTo(91)
        }
        productLabel.snp.makeConstraints {
            $0.top.equalTo(subtitleLabel.snp.bottom).offset(29)
            $0.leading.equalTo(imageView.snp.trailing).offset(15)
        }
        descLabel.snp.makeConstraints {
            $0.top.equalTo(productLabel.snp.bottom).offset(4)
            $0.leading.equalTo(imageView.snp.trailing).offset(15)
        }
        sizeCollectionView.snp.makeConstraints {
            $0.top.equalTo(imageView.snp.bottom).offset(35)
            $0.horizontalEdges.equalToSuperview().inset(15)
            $0.height.equalTo(102)
        }
        
        divideLine.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(2)
            $0.bottom.equalTo(bottomView.snp.top)
        }
        
        bottomView.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview()
            $0.bottom.equalTo(safeAreaLayoutGuide)
            $0.height.equalTo(95)
        }
    }
}
