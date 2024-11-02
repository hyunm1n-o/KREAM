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
        setupTag()
        setUpNavigationBarItem()
    }
    
    override func viewWillAppear(_ animated: Bool) {
      navigationController?.isNavigationBarHidden = true // 뷰 컨트롤러가 나타날 때 숨기기
    }

    override func viewWillDisappear(_ animated: Bool) {
      navigationController?.isNavigationBarHidden = false // 뷰 컨트롤러가 사라질 때 나타내기
    }
    
    private lazy var homeView = HomeView().then {
        $0.searchField.addTarget(
            self,
            action: #selector(searchFieldTapped),
            for: .touchUpInside
        )
    }

    private func setupDelegate() {
        homeView.firstCollectionView.delegate = self
        homeView.firstCollectionView.dataSource = self
        
        homeView.secondCollectionView.delegate = self
        homeView.secondCollectionView.dataSource = self
        
        homeView.thirdCollectionView.delegate = self
        homeView.thirdCollectionView.dataSource = self
    }
    
    private func setupTag() {
        homeView.firstCollectionView.tag = 1
        homeView.secondCollectionView.tag = 2
        homeView.thirdCollectionView.tag = 3
    }
    
    private func setupAction() {
        homeView.segmentedControl.addTarget(
            self,
            action: #selector(segmentControlValueChanged(segment: )),
            for: .valueChanged
        )
    }
    
    private func setUpNavigationBarItem() {
        let backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
        self.navigationItem.backBarButtonItem = backBarButtonItem
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
            homeView.stackView.isHidden = false
            changeLinePosition(leading: 16, width: 28)
        case 1:
            homeView.stackView.isHidden = true
            changeLinePosition(leading: 71, width: 28)
        case 2:
            homeView.stackView.isHidden = true
            changeLinePosition(leading: 123, width: 56)
        case 3:
            homeView.stackView.isHidden = true
            changeLinePosition(leading: 199, width: 42)
        case 4:
            homeView.stackView.isHidden = true
            changeLinePosition(leading: 264, width: 28)
        case 5:
            homeView.stackView.isHidden = true
            changeLinePosition(leading: 320, width: 28)
        default:
            break
        }
    }
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView.tag == 1 {
            return HomeModel.dummy().count
        }
        if collectionView.tag == 2 {
            return JustDroppedModel.dummy().count
        }
        if collectionView.tag == 3 {
            return ColdWaveModel.dummy().count
        }
        
        fatalError("Unexpected collection view tag: \(collectionView.tag)")
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView.tag == 1 {
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
        if collectionView.tag == 2 {
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: JustDroppedCell.identifier,
                for: indexPath) as? JustDroppedCell else {
                return UICollectionViewCell()
            }
            let list = JustDroppedModel.dummy()
            
            cell.imageView.image = list[indexPath.row].image
            cell.transactionsLabel.text = "거래 \(String(format: "%.1f", list[indexPath.row].transactions))만"
            cell.brandLabel.text = list[indexPath.row].brand
            cell.productLabel.text = list[indexPath.row].product
            cell.priceLabel.text = list[indexPath.row].price
            return cell
        }
        if collectionView.tag == 3 {
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: ColdWaveCell.identifier,
                for: indexPath) as? ColdWaveCell else {
                return UICollectionViewCell()
            }
            let list = ColdWaveModel.dummy()
            
            cell.imageView.image = list[indexPath.row].image
            cell.instaIDLabel.text = list[indexPath.row].instaID
            return cell
        }
        
        fatalError("Unexpected collection view tag: \(collectionView.tag)")
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView.tag == 2 {
            if indexPath.item == 0 {
                // 6주차 페이지로 넘겨주기
                let detailVC = DetailViewController()
                navigationController?.pushViewController(detailVC, animated: true)
            }
        }
    }
}
