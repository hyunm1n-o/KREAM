//
//  SavedView.swift
//  KREAM
//
//  Created by 오현민 on 10/9/24.
//

import UIKit
import Then
import SnapKit

class SavedView: UIView {

    let totalCount = dummySavedModel.savedDatas.count
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        setViews()
        setConstaints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - 컴포넌트
    private lazy var titleLabel = UILabel().then {
        $0.text = "Saved"
        $0.font = UIFont.systemFont(ofSize: 28, weight: .bold)
        $0.textColor = .black
        $0.textAlignment = .left
    }
    
    private lazy var totalLabel = UILabel().then {
        $0.text = "전체 \(totalCount)개"
        $0.font = UIFont.systemFont(ofSize: 14)
        $0.textColor = .black
        $0.textAlignment = .left
    }
    
    public lazy var tableView = UITableView().then {
        $0.register(SavedCell.self, forCellReuseIdentifier: SavedCell.identifier)
        $0.separatorStyle = .singleLine
    }
    
    //MARK: - 화면 설정
    private func setViews() {
        self.addSubview(titleLabel)
        self.addSubview(totalLabel)
        self.addSubview(tableView)
    }
    
    private func setConstaints() {
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(61)
            make.leading.equalToSuperview().inset(10)
        }
        
        totalLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(16)
            make.leading.equalToSuperview().inset(13)
        }
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(totalLabel.snp.bottom).offset(12)
            make.leading.trailing.bottom.equalToSuperview()
        }
    }
    
}
