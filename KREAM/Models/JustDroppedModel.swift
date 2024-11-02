//
//  JustDroppedModel.swift
//  KREAM
//
//  Created by 오현민 on 10/15/24.
//

import Foundation
import UIKit

struct JustDroppedModel {
    let image: UIImage
    let transactions: Float
    let brand: String
    let product: String
    let price: String
}

extension JustDroppedModel {
    static func dummy() -> [JustDroppedModel] {
        return [
            JustDroppedModel(image: .justDropped4, transactions: 11.8, brand: "Matin Kim", product: "Matin Kim Logo Coating Jumper", price: "228,000원"),
            JustDroppedModel(image: .justDropped1, transactions: 12.8, brand: "MLB", product: "청키라이너 뉴욕양키스", price: "139,000원"),
            JustDroppedModel(image: .justDropped2, transactions: 15.6, brand: "Jordan", product: "Jordan 1 Retro High OG Yellow Ochre", price: "228,000원"),
            JustDroppedModel(image: .justDropped3, transactions: 12.8, brand: "Human Made", product: "Human Made x Kaws Varsity Jacket #1 Black", price: "2,000,000원")
        ]
    }
}
