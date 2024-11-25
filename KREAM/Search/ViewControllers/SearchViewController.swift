//
//  SearchViewController.swift
//  KREAM
//
//  Created by 오현민 on 10/13/24.
//

import UIKit

class SearchViewController: UIViewController {
    
    private let dummy: [String] = [
        "채원 슈프림 후리스",
        "나이키V2K런",
        "뉴발란스996",
        "신상 나이키 콜라보",
        "허그 FW 패딩",
        "벨루어 눕시"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(searchView)
        
        searchView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        setupDelegate()
        
    }
    
    private lazy var searchView = SearchView().then {
        $0.cancelButton.addTarget(
            self,
            action: #selector(cancelButtonTapped),
            for: .touchUpInside)
        
        $0.searchField.addTarget(
            self,
            action: #selector(searchFieldTapped),
            for: .touchUpInside)
        
    }
    
    private func setupDelegate() {
        searchView.recommendCollectionView.delegate = self
        searchView.recommendCollectionView.dataSource = self
    }
    
    // MARK: - @objc
    @objc
    private func cancelButtonTapped() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc
    private func searchFieldTapped() {
        let detailSearchVC = DetailSearchViewController()
        detailSearchVC.modalPresentationStyle = .fullScreen
        detailSearchVC.view.backgroundColor = .white
        present(detailSearchVC, animated: true)
    }
}

extension SearchViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dummy.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RecommendCell.identifier, for: indexPath) as? RecommendCell else {
            return UICollectionViewCell()
        }
        cell.configure(name: dummy[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return RecommendCell.fittingSize(availableHeight: 32, name: dummy[indexPath.item])
    }
}
