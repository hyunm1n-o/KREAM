//
//  HomeViewController.swift
//  KREAM
//
//  Created by 오현민 on 9/26/24.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = homeView
        
        setupAction()
        setupDelegate()
    }
    
    private lazy var homeView = HomeView().then {
        $0.searchField.addTarget(
            self,
            action: #selector(searchFieldTapped),
            for: .touchUpInside
        )
    }

    private func setupDelegate() {
        homeView.collectionView.delegate = self
        homeView.collectionView.dataSource = self
    }
    
    private func setupAction() {
        homeView.segmentedControl.addTarget(
            self,
            action: #selector(segmentControlValueChanged(segment: )),
            for: .valueChanged
        )
    }
    
    private func changeLinePosition(leading: Int, width: Int) {
        UIView.animate(withDuration: 0.2, animations: {
            self.homeView.underLineView.snp.updateConstraints {  $0.leading.equalTo(self.homeView.segmentedControl.snp.leading).offset(leading)
                $0.width.equalTo(width)
            }
            self.view.layoutIfNeeded()
        })
    }
    
    @objc
    private func searchFieldTapped() {
        let searchVC = SearchViewController()
        searchVC.modalPresentationStyle = .automatic
        present(searchVC, animated: true)
    }
    
    @objc
    private func segmentControlValueChanged(segment: UISegmentedControl) {
        switch segment.selectedSegmentIndex {
        case 0:
            homeView.adImageView.isHidden = false
            homeView.collectionView.isHidden = false
            
            changeLinePosition(leading: 16, width: 28)
        case 1:
            homeView.adImageView.isHidden = true
            homeView.collectionView.isHidden = true
            
            changeLinePosition(leading: 71, width: 28)
        case 2:
            homeView.adImageView.isHidden = true
            homeView.collectionView.isHidden = true
            
            changeLinePosition(leading: 123, width: 56)
        case 3:
            homeView.adImageView.isHidden = true
            homeView.collectionView.isHidden = true
            
            changeLinePosition(leading: 199, width: 42)
        case 4:
            homeView.adImageView.isHidden = true
            homeView.collectionView.isHidden = true
            
            changeLinePosition(leading: 264, width: 28)
        case 5:
            homeView.adImageView.isHidden = true
            homeView.collectionView.isHidden = true
            
            changeLinePosition(leading: 320, width: 28)
        default:
            break
        }
    }
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return HomeModel.dummy().count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: HomeCell.identifier,
            for: indexPath) as? HomeCell else {
            return UICollectionViewCell()
        }
        let list = HomeModel.dummy()
        
        cell.imageView.image = list[indexPath.row].homeImage
        cell.titleLabel.text = list[indexPath.row].homeTitle
        
        return cell
    }
}
