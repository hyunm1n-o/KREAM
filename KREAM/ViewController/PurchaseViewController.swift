//
//  PurchaseViewController.swift
//  KREAM
//
//  Created by 오현민 on 11/2/24.
//

import UIKit

class PurchaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = purchaseView
        
        setupDelegate()
    }
    
    private lazy var purchaseView = PurchaseView().then {
        $0.cancleButton.addTarget(self,
                                  action: #selector(cancleButtonTapped),
                                  for: .touchUpInside)
    }
    
    @objc
    private func cancleButtonTapped() {
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    private func setupDelegate() {
        purchaseView.sizeCollectionView.delegate = self
        purchaseView.sizeCollectionView.dataSource = self
    }
}

extension PurchaseViewController : UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return SizeModel.dummy().count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SizeCell.identifier, for: indexPath) as? SizeCell else {
            return UICollectionViewCell()
        }
        let list = SizeModel.dummy()
        cell.sizeLabel.text = list[indexPath.row].size
        
        return cell
    }

    
}
