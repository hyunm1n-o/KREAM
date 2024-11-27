//
//  HomeCollectionViewDataSource.swift
//  KREAM
//
//  Created by 오현민 on 11/3/24.
//

import Foundation
import UIKit

class HomeCollectionViewDataSource: NSObject, UICollectionViewDataSource {
    private let homeData: [HomeModel]
    private let justdroppedData: [JustDroppedModel]
    private let coldWaveData: [ColdWaveModel]
    
    init(homeData: [HomeModel], justdroppedData: [JustDroppedModel], coldWaveData: [ColdWaveModel]) {
        self.homeData = homeData
        self.justdroppedData = justdroppedData
        self.coldWaveData = coldWaveData
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView.tag {
        case 1:
            return homeData.count
        case 2:
            return justdroppedData.count
        case 3:
            return coldWaveData.count
        default:
            fatalError()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView.tag {
        case 1:
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: HomeCell.identifier,
                for: indexPath) as? HomeCell else {
                return UICollectionViewCell()
            }
            let list = HomeModel.dummy()
            
            cell.imageView.image = list[indexPath.row].homeImage
            cell.titleLabel.text = list[indexPath.row].homeTitle
            return cell
        case 2:
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: JustDroppedCell.identifier,
                for: indexPath) as? JustDroppedCell else {
                return UICollectionViewCell()
            }
            let list = JustDroppedModel.dummy()
            
            cell.loadImage(from: list[indexPath.row].imageURL)
            cell.transactionsLabel.text = "거래 \(String(format: "%.1f", list[indexPath.row].transactions))만"
            cell.brandLabel.text = list[indexPath.row].brand
            cell.productLabel.text = list[indexPath.row].product
            cell.priceLabel.text = list[indexPath.row].price
            return cell
        case 3:
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: ColdWaveCell.identifier,
                for: indexPath) as? ColdWaveCell else {
                return UICollectionViewCell()
            }
            let list = ColdWaveModel.dummy()
            
            cell.loadImage(from: list[indexPath.row].imageURL)
            cell.instaIDLabel.text = list[indexPath.row].instaID
            return cell
        default:
            fatalError()
        }
    }
}
