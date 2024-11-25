//
//  DetailSearchViewController.swift
//  KREAM
//
//  Created by 오현민 on 11/23/24.
//

import UIKit
import Moya

class DetailSearchViewController: UIViewController {
    
    private var products: [Product] = []
    private var titles: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(detailSearchView)
        setupDelegate()
        
        detailSearchView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    private lazy var detailSearchView = DetailSearchView().then {
        $0.cancelButton.addTarget(
            self,
            action: #selector(cancelButtonTapped),
            for: .touchUpInside)
        
        $0.backButton.addTarget(
            self,
            action: #selector(backButtonTapped),
            for: .touchUpInside)
    }
    
    private func setupDelegate() {
        detailSearchView.searchBar.delegate = self
        detailSearchView.tableView.delegate = self
        detailSearchView.tableView.dataSource = self
    }
    
    // MARK: - @objc
    @objc
    private func cancelButtonTapped() {
        self.view.window?.rootViewController?.dismiss(animated: true, completion: nil)
    }
    
    @objc
    private func backButtonTapped() {
        dismiss(animated: true, completion: nil)
    }
}

extension DetailSearchViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if let query = detailSearchView.searchBar.text?.trimmingCharacters(in: .whitespacesAndNewlines), !query.isEmpty {
            let searchDataManager = SearchResultDataManager()
            
            searchDataManager.getSearchResult(query: query) { [weak self] searchResult in
                guard let self = self else { return }
                if let titles = searchResult?.products?.compactMap({ $0.title }) {
                    DispatchQueue.main.async {
                        self.titles = titles
                        self.detailSearchView.tableView.reloadData()
                    }
                } else {
                    print("검색결과 불러오기 실패")
                }
            }
            
        }
    }
}

extension DetailSearchViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titles.count // titles 배열의 개수에 따라 표시
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SearchCell.identifier, for: indexPath) as? SearchCell else {
            return UITableViewCell()
        }
        
        let title = titles[indexPath.row]
        cell.configure(with: title) // 셀에 제목 전달
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    private func updateTableView(with titles: [String]) {
        self.titles = titles
        detailSearchView.tableView.reloadData()
    }
    
}
