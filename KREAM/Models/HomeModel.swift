//
//  HomeModel.swift
//  KREAM
//
//  Created by 오현민 on 10/13/24.
//

import Foundation
import UIKit

struct HomeModel {
    let homeImage: UIImage
    let homeTitle: String
}

extension HomeModel {
    static func dummy() -> [HomeModel] {
        return [
            HomeModel(homeImage: .home1, homeTitle: "크림 드로우"),
            HomeModel(homeImage: .home2, homeTitle: "실시간 차트"),
            HomeModel(homeImage: .home3, homeTitle: "남성 추천"),
            HomeModel(homeImage: .home4, homeTitle: "여성 추천"),
            HomeModel(homeImage: .home5, homeTitle: "색다른 추천"),
            HomeModel(homeImage: .home6, homeTitle: "정가 아래"),
            HomeModel(homeImage: .home7, homeTitle: "윤세 24AW"),
            HomeModel(homeImage: .home8, homeTitle: "올해의 베스트"),
            HomeModel(homeImage: .home9, homeTitle: "10월 베네핏"),
            HomeModel(homeImage: .home10, homeTitle: "아크네 선물")
        ]
    }
}
