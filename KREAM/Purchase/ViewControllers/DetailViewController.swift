//
//  DetailViewController.swift
//  KREAM
//
//  Created by 오현민 on 11/2/24.
//

import UIKit

class DetailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = deatilView
        
        setupDelegate()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tabBarController?.tabBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        tabBarController?.tabBar.isHidden = false
    }
    
    private lazy var deatilView = DetailView().then {
        $0.bottomView.purchaseButton.addTarget(
            self,
            action: #selector(purchaseButtonTapped),
            for: .touchUpInside)
    }

    @objc
    private func purchaseButtonTapped() {
        let purchaseVC = PurchaseViewController()
        self.present(purchaseVC, animated: true, completion: nil)
    }
    
    private func setupDelegate() {
        deatilView.collectionView.delegate = self
        deatilView.collectionView.dataSource = self
    }
}

extension DetailViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return DetailModel.dummy().count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DetailCell.identifier, for: indexPath) as? DetailCell else {
            return UICollectionViewCell()
        }
        let list = DetailModel.dummy()
        
        cell.imageView.image = list[indexPath.row].image
        
        return cell
    }
}
