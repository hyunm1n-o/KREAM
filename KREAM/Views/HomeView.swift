//
//  HomeView.swift
//  KREAM
//
//  Created by 오현민 on 10/12/24.
//

import UIKit

class HomeView: UIView {
    
    //MARK: - 컴포넌트
    /* 검색버튼, 알림버튼, 세그먼트컨트롤, 배너이미지뷰, 컬렉션뷰*/
    public lazy var segmentedControl = UISegmentedControl(items: ["추천", "랭킹", "발매정보", "럭셔리", "남성", "여성"]).then {
        $0.setBackgroundImage(UIImage(), for: .normal, barMetrics: .default)
        $0.setBackgroundImage(UIImage(), for: .selected, barMetrics: .default)
        $0.setBackgroundImage(UIImage(), for: .highlighted, barMetrics: .default)
        $0.setDividerImage(UIImage(), forLeftSegmentState: .normal, rightSegmentState: .selected, barMetrics: .default)
        
        $0.setContentOffset(CGSize(width: -5, height: 0), forSegmentAt: 1)
        $0.setContentOffset(CGSize(width: 8, height: 0), forSegmentAt: 3)
        $0.setContentOffset(CGSize(width: 5, height: 0), forSegmentAt: 4)

        $0.setTitleTextAttributes(
            [
                NSAttributedString.Key.foregroundColor: UIColor.black,
                .font: UIFont.systemFont(ofSize: 16, weight: .light)
            ],
            for: .normal
        )
        
        $0.setTitleTextAttributes(
            [
                NSAttributedString.Key.foregroundColor: UIColor.black,
                .font: UIFont.systemFont(ofSize: 16, weight: .bold)
            ],
            for: .selected
        )
        
        $0.selectedSegmentIndex = 0
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    public lazy var underLineView = UIView().then {
        $0.backgroundColor = .black
        $0.translatesAutoresizingMaskIntoConstraints = false
        
    }
    
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
    
    public lazy var alertButton = UIButton().then {
        var config = UIButton.Configuration.plain()
        config.image = UIImage(named: "KREAM-alert")
        
        $0.configuration = config
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    //MARK: - 추천탭
    public lazy var adImageView = UIImageView().then {
        $0.image = UIImage(named: "KREAM-ad")
        $0.contentMode = .scaleAspectFill
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    public lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout().then {
        $0.estimatedItemSize = .init(width: 61, height: 81)
        $0.minimumLineSpacing = 20
        $0.minimumInteritemSpacing = 9
        $0.scrollDirection = .vertical
    }).then {
        $0.isScrollEnabled = false
        $0.register(HomeCell.self, forCellWithReuseIdentifier: HomeCell.identifier)
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
        self.addSubview(searchField)
        self.addSubview(alertButton)
        self.addSubview(segmentedControl)
        self.addSubview(underLineView)
        self.addSubview(adImageView)
        self.addSubview(collectionView)
    }
    
    private func setConstraints() {
        searchField.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide).offset(6)
            $0.leading.equalToSuperview().inset(16)
            $0.trailing.equalTo(alertButton.snp.leading).offset(-15)
            $0.height.equalTo(40)
        }
        
        alertButton.snp.makeConstraints {
            $0.centerY.equalTo(searchField)
            $0.trailing.equalToSuperview().inset(16)
            $0.width.height.equalTo(24)
        }
        
        segmentedControl.snp.makeConstraints {
            $0.top.equalTo(searchField.snp.bottom).offset(16)
            $0.horizontalEdges.equalToSuperview().inset(14)
            $0.height.equalTo(27)
        }
        
        underLineView.snp.makeConstraints {
            $0.top.equalTo(segmentedControl.snp.bottom)
            $0.height.equalTo(2)
            
            $0.leading.equalTo(segmentedControl.snp.leading).offset(16)
            $0.width.equalTo(28)
        }
        
        adImageView.snp.makeConstraints {
            $0.top.equalTo(underLineView.snp.bottom).offset(10)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(336)
        }
        
        collectionView.snp.makeConstraints {
            $0.top.equalTo(adImageView.snp.bottom).offset(20)
            $0.horizontalEdges.equalToSuperview().inset(16)
            $0.height.equalTo(182)
        }
        
    }
}
