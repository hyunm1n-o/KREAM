//
//  HomeCollectionViewDelegate.swift
//  KREAM
//
//  Created by 오현민 on 11/3/24.
//

import Foundation
import UIKit

class HomeCollectionViewDelegate: NSObject, UICollectionViewDelegate {
    weak var navigationController: UINavigationController?
    
    init(navigationController: UINavigationController?) {
        self.navigationController = navigationController
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
