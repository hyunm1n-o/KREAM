//
//  SearchView.swift
//  KREAM
//
//  Created by 오현민 on 11/23/24.
//

import UIKit

class SearchView: UIView {
    
    //MARK: - 컴포넌트
    private lazy var titleContainer: AttributeContainer = {
        var container = AttributeContainer()
        container.font = UIFont.systemFont(ofSize: 13.5)
        return container
    }()
    
    public lazy var searchField = UIButton().then {
        var config = UIButton.Configuration.filled()
        
        config.attributedTitle = AttributedString("브랜드, 상품, 프로필, 태그 등", attributes: titleContainer)
        
        config.baseBackgroundColor = .F_5_F_5_F_5
        config.baseForegroundColor = .B_6_B_6_B_6
        config.cornerStyle = .large
        
        $0.tintAdjustmentMode = .dimmed
        $0.configuration = config
        $0.contentHorizontalAlignment = .left
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    public lazy var cancelButton = UIButton().then {
        $0.setTitle("취소", for: .normal)
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        $0.setTitleColor(.black, for: .normal)
        $0.backgroundColor = .clear
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private lazy var divideLine = DivideLineView()
    
    private lazy var recommendLabel = UILabel().then {
        $0.text = "추천 검색어"
        $0.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        $0.textColor = .black
        $0.textAlignment = .left
    }
    
    public lazy var recommendCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout().then {
        $0.minimumLineSpacing = 12
        $0.minimumInteritemSpacing = 8
        $0.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
    }).then {
        $0.isScrollEnabled = false
        $0.register(RecommendCell.self, forCellWithReuseIdentifier: RecommendCell.identifier)
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    //MARK: - 화면설정
    override init(frame: CGRect) {
        super.init(frame: frame)

        setView()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setView() {
        self.addSubview(searchField)
        self.addSubview(cancelButton)
        self.addSubview(divideLine)
        self.addSubview(recommendLabel)
        self.addSubview(recommendCollectionView)
    }

    private func setConstraints() {
        searchField.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide).offset(7)
            $0.leading.equalToSuperview().inset(16)
            $0.trailing.equalTo(cancelButton.snp.leading).offset(-11)
            $0.height.equalTo(39)
        }
        
        cancelButton.snp.makeConstraints {
            $0.centerY.equalTo(searchField)
            $0.trailing.equalToSuperview().inset(16)
            $0.width.equalTo(25)
            $0.height.equalTo(17)
        }
        
        divideLine.snp.makeConstraints {
            $0.top.equalTo(searchField.snp.bottom).offset(11)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(1)
        }
        
        recommendLabel.snp.makeConstraints {
            $0.top.equalTo(divideLine.snp.bottom).offset(30)
            $0.leading.equalToSuperview().inset(16)
        }
        
        recommendCollectionView.snp.makeConstraints {
            $0.top.equalTo(recommendLabel.snp.bottom).offset(11)
            $0.leading.equalToSuperview().inset(15)
            $0.width.equalTo(332)
            $0.height.equalTo(76)
        }
    }

}

