//
//  DetailSearchView.swift
//  KREAM
//
//  Created by 오현민 on 11/23/24.
//

import UIKit

class DetailSearchView: UIView {
    
    //MARK: - 컴포넌트
    private lazy var titleContainer: AttributeContainer = {
        var container = AttributeContainer()
        container.font = UIFont.systemFont(ofSize: 13.5)
        return container
    }()
    
    public lazy var searchBar = UISearchBar().then {
        $0.placeholder = "브랜드, 상품, 프로필, 태그 등"
        $0.searchBarStyle = .minimal
        
        $0.searchTextField.layer.cornerRadius = 10
        $0.searchTextField.clipsToBounds = true
        
        $0.searchTextField.font = UIFont.systemFont(ofSize: 13.5)
        $0.searchTextField.textColor = .black
        $0.searchTextField.leftView = nil
    }

    
    public lazy var backButton = UIButton().then {
        var config = UIButton.Configuration.plain()
        config.image = UIImage(named: "KREAM-back2")
        
        $0.configuration = config
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
    
    public lazy var tableView = UITableView().then {
        $0.register(SearchCell.self, forCellReuseIdentifier: SearchCell.identifier)
        $0.separatorStyle = .none
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    //MARK: - 화면설정
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
        self.addSubview(searchBar)
        self.addSubview(cancelButton)
        self.addSubview(backButton)
        self.addSubview(divideLine)
        self.addSubview(tableView)
    }
    
    private func setConstraints() {
        searchBar.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide).offset(7)
            $0.leading.equalTo(backButton.snp.trailing).offset(15)
            $0.trailing.equalTo(cancelButton.snp.leading).offset(-11)
            $0.height.equalTo(39)
        }
        
        cancelButton.snp.makeConstraints {
            $0.centerY.equalTo(searchBar)
            $0.trailing.equalToSuperview().inset(16)
            $0.width.equalTo(25)
            $0.height.equalTo(17)
        }
        
        backButton.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(15)
            $0.centerY.equalTo(searchBar)
            $0.width.height.equalTo(24)
        }
        
        divideLine.snp.makeConstraints {
            $0.top.equalTo(searchBar.snp.bottom).offset(11)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(1)
        }
        
        tableView.snp.makeConstraints {
            $0.top.equalTo(divideLine.snp.bottom).offset(10)
            $0.leading.equalToSuperview().inset(16)
            $0.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
    }
    
}
