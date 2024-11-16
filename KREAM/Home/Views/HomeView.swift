//
//  HomeView.swift
//  KREAM
//
//  Created by 오현민 on 10/12/24.
//

import UIKit

class HomeView: UIView {
    
    //MARK: - 기본 컴포넌트
    private lazy var scrollView = UIScrollView().then {
        $0.showsVerticalScrollIndicator = true
        $0.showsHorizontalScrollIndicator = false
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    public lazy var stackView = UIStackView().then {
        $0.axis = .vertical
        $0.distribution = .equalSpacing
        $0.alignment = .fill
        $0.spacing = 20
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
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
    
    public lazy var firstCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout().then {
        $0.estimatedItemSize = .init(width: 61, height: 81)
        $0.minimumLineSpacing = 20
        $0.minimumInteritemSpacing = 9
        $0.scrollDirection = .vertical
    }).then {
        $0.isScrollEnabled = false
        $0.register(HomeCell.self, forCellWithReuseIdentifier: HomeCell.identifier)
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    //MARK: - 구분선
    private lazy var divideLine1 = DivideLineView()
    
    private lazy var justDroppedView = UIView().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private lazy var justDroppedLabel = UILabel().then {
        $0.text = "Just Dropped"
        $0.font = .systemFont(ofSize: 16, weight: .bold)
        $0.textColor = .black
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private lazy var justDroppedSubLabel = UILabel().then {
        $0.text = "발매 상품"
        $0.font = .systemFont(ofSize: 13, weight: .light)
        $0.textColor = ._878787
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    public lazy var secondCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout().then {
        $0.estimatedItemSize = .init(width: 142, height: 237)
        $0.minimumInteritemSpacing = 8
        $0.scrollDirection = .horizontal
    }).then {
        $0.isScrollEnabled = true
        $0.register(JustDroppedCell.self, forCellWithReuseIdentifier: JustDroppedCell.identifier)
        $0.showsHorizontalScrollIndicator = false
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    //MARK: - 구분선
    private lazy var divideLine2 = DivideLineView()
    
    private lazy var coldWaveView = UIView().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private lazy var coldWaveLabel = UILabel().then {
        $0.text = "본격 한파대비! 연말 필수템 모음"
        $0.font = .systemFont(ofSize: 16, weight: .bold)
        $0.textColor = .black
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private lazy var coldWaveSubLabel = UILabel().then {
        $0.text = "#해피홀리룩챌린지"
        $0.font = .systemFont(ofSize: 13, weight: .light)
        $0.textColor = ._878787
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    public lazy var thirdCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout().then {
        $0.estimatedItemSize = .init(width: 124, height: 165)
        $0.minimumInteritemSpacing = 8
        $0.scrollDirection = .horizontal
    }).then {
        $0.isScrollEnabled = true
        $0.register(ColdWaveCell.self, forCellWithReuseIdentifier: ColdWaveCell.identifier)
        $0.showsHorizontalScrollIndicator = false
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    //MARK: - 화면 설정
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        
        setView()
        setStackView()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setStackView() {
        stackView.addArrangedSubview(adImageView)
        stackView.addArrangedSubview(firstCollectionView)
        
        stackView.addArrangedSubview(divideLine1)
        stackView.addArrangedSubview(justDroppedView)
        
        stackView.addArrangedSubview(divideLine2)
        stackView.addArrangedSubview(coldWaveView)
    }
    
    private func setView() {
        self.addSubview(scrollView)
        scrollView.addSubview(stackView)
        
        self.addSubview(searchField)
        self.addSubview(alertButton)
        self.addSubview(segmentedControl)
        self.addSubview(underLineView)
        
        // 스택뷰
        justDroppedView.addSubview(justDroppedLabel)
        justDroppedView.addSubview(justDroppedSubLabel)
        justDroppedView.addSubview(secondCollectionView)
        
        coldWaveView.addSubview(coldWaveLabel)
        coldWaveView.addSubview(coldWaveSubLabel)
        coldWaveView.addSubview(thirdCollectionView)
    }
    
    private func setConstraints() {
        scrollView.snp.makeConstraints {
            $0.top.equalTo(underLineView.snp.bottom)
            $0.horizontalEdges.bottom.equalToSuperview()
        }
        
        stackView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.width.equalTo(scrollView.snp.width)
        }
        
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
        
        // 스택뷰
        adImageView.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(336)
        }
        
        firstCollectionView.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(16)
            $0.height.equalTo(182)
        }
        
        divideLine1.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(1)
        }
        
        justDroppedView.snp.makeConstraints {
            $0.height.equalTo(300) // +10
        }
        
        justDroppedLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview().inset(16)
        }
        
        justDroppedSubLabel.snp.makeConstraints {
            $0.top.equalTo(justDroppedLabel.snp.bottom).offset(4)
            $0.leading.equalToSuperview().inset(16)
        }
        
        secondCollectionView.snp.makeConstraints {
            $0.top.equalTo(justDroppedSubLabel.snp.bottom).offset(14)
            $0.leading.equalToSuperview().inset(16)
            $0.trailing.equalToSuperview()
            $0.height.equalTo(237)
        }
        
        divideLine2.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(1)
        }
        
        coldWaveView.snp.makeConstraints {
            $0.height.equalTo(228) // +10
        }
        
        coldWaveLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview().inset(16)
        }
        
        coldWaveSubLabel.snp.makeConstraints {
            $0.top.equalTo(coldWaveLabel.snp.bottom).offset(4)
            $0.leading.equalToSuperview().inset(16)
        }
        
        thirdCollectionView.snp.makeConstraints {
            $0.top.equalTo(coldWaveSubLabel.snp.bottom).offset(14)
            $0.leading.equalToSuperview().inset(16)
            $0.trailing.equalToSuperview()
            $0.height.equalTo(165)
        }
    }
}
