//
//  DetailView.swift
//  KREAM
//
//  Created by 오현민 on 11/1/24.
//

import UIKit

class DetailView: UIView {

    //MARK: - 컴포넌트
    private lazy var imageView = UIImageView().then {
        $0.image = UIImage(named: "KREAM-detail")
        $0.contentMode = .scaleAspectFill
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    public lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout().then {
        $0.estimatedItemSize = .init(width: 53, height: 53)
        $0.minimumInteritemSpacing = 8
        $0.scrollDirection = .horizontal
    }).then {
        $0.isScrollEnabled = true
        $0.register(DetailCell.self, forCellWithReuseIdentifier: DetailCell.identifier)
        $0.showsHorizontalScrollIndicator = false
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private lazy var instantPriceLabel = UILabel().then {
        $0.text = "즉시 구매가"
        $0.font = .systemFont(ofSize: 12, weight: .light)
        $0.textColor = .black
        $0.textAlignment = .left
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private lazy var priceLabel = UILabel().then {
        $0.text = "228,000원"
        $0.font = .systemFont(ofSize: 20, weight: .semibold)
        $0.textColor = .black
        $0.textAlignment = .left
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private lazy var productLabel = UILabel().then {
        $0.text = "Matin Kim Logo Coating Jumper"
        $0.font = .systemFont(ofSize: 16)
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
    
    private lazy var divideLine = DivideLineView().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    public lazy var bottomView = BottomView().then {
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
        self.addSubview(imageView)
        self.addSubview(collectionView)
        self.addSubview(instantPriceLabel)
        self.addSubview(priceLabel)
        self.addSubview(productLabel)
        self.addSubview(descLabel)
        
        self.addSubview(divideLine)
        self.addSubview(bottomView)
    }
    
    private func setConstraints() {
        imageView.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide).offset(5)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(373)
        }
        
        collectionView.snp.makeConstraints {
            $0.top.equalTo(imageView.snp.bottom).offset(20)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(53)
        }
        
        instantPriceLabel.snp.makeConstraints {
            $0.top.equalTo(collectionView.snp.bottom).offset(23)
            $0.leading.equalToSuperview().inset(16)
        }
        
        priceLabel.snp.makeConstraints {
            $0.top.equalTo(instantPriceLabel.snp.bottom).offset(4)
            $0.leading.equalToSuperview().inset(16)
        }
        
        productLabel.snp.makeConstraints {
            $0.top.equalTo(priceLabel.snp.bottom).offset(18)
            $0.leading.equalToSuperview().inset(16)
        }
        
        descLabel.snp.makeConstraints {
            $0.top.equalTo(productLabel.snp.bottom).offset(6)
            $0.leading.equalToSuperview().inset(16)
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
