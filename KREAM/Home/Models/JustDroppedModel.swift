//
//  JustDroppedModel.swift
//  KREAM
//
//  Created by 오현민 on 10/15/24.
//

import Foundation
import UIKit

struct JustDroppedModel {
    let imageURL: String
    let transactions: Float
    let brand: String
    let product: String
    let price: String
}

extension JustDroppedModel {
    static func dummy() -> [JustDroppedModel] {
        return [
            JustDroppedModel(imageURL: "https://pbs.twimg.com/profile_images/1568998644673843202/CZgQSNk8_400x400.jpg", transactions: 11.8, brand: "Matin Kim", product: "Matin Kim Logo Coating Jumper", price: "228,000원"),
            JustDroppedModel(imageURL: "https://pbs.twimg.com/media/FzIb9p1aMAE9N9U.png", transactions: 12.8, brand: "MLB", product: "청키라이너 뉴욕양키스", price: "139,000원"),
            JustDroppedModel(imageURL: "https://pbs.twimg.com/media/GGSEB0WbcAATp-C.jpg", transactions: 15.6, brand: "Jordan", product: "Jordan 1 Retro High OG Yellow Ochre", price: "228,000원"),
            JustDroppedModel(imageURL: "https://pbs.twimg.com/media/GSIFMbzaUAEh_FN?format=jpg&name=large", transactions: 12.8, brand: "Human Made", product: "Human Made x Kaws Varsity Jacket #1 Black", price: "2,000,000원"),
            JustDroppedModel(imageURL: "https://pbs.twimg.com/media/F-vBrz0bgAEQF9P.jpg:large" , transactions: 14.2, brand: "우와", product: "생일 축하해", price: "2,000,000원"),
            JustDroppedModel(imageURL: "https://pbs.twimg.com/media/GCaBapNbMAAqGOP.jpg" , transactions: 15.3, brand: "나는", product: "집갈래", price: "2,000원"),
            JustDroppedModel(imageURL: "https://pbs.twimg.com/media/F1aCvmLXgAAKzX_.jpg", transactions: 11.2, brand: "찰칵", product: "내 셀카", price: "3억원"),
            JustDroppedModel(imageURL: "https://pbs.twimg.com/media/FzIb9p1aMAE9N9U.png" , transactions: 32.8, brand: "히히", product: "궁금하면", price: "500원"),
            JustDroppedModel(imageURL: "https://i.pinimg.com/1200x/07/b0/82/07b082eb7e318510fc477199a682657a.jpg", transactions: 52.2, brand: "한국인삼공사", product: "인간인삼", price: "2,000,000원"),
            JustDroppedModel(imageURL: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSvbJsYKiUJMjyUxL_zvFVeQ9Ypgdm85sYPmw&s", transactions: 9.8, brand: "굳이 왜", product: "10개까지하라고하셨어요?", price: "2,000,000원"),
        ]
    }
}
