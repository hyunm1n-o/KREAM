//
//  ColdWaveModel.swift
//  KREAM
//
//  Created by 오현민 on 10/16/24.
//

import Foundation
import UIKit

struct ColdWaveModel {
    let imageURL: String
    let instaID: String
}

extension ColdWaveModel {
    static func dummy() -> [ColdWaveModel] {
        return [
            ColdWaveModel(imageURL: "https://www.kstarfashion.com/news/photo/202409/219201_139884_1651.jpg", instaID: "@katarinabluu"),
            ColdWaveModel(imageURL: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTWe7wddlv9NYBer33Jun8YcxmK_zfvEKq8cQ&s", instaID: "@imwinter"),
            ColdWaveModel(imageURL: "https://cdn.newsworks.co.kr/news/photo/202010/496864_387283_5727.jpg", instaID: "@thousand_wooo"),
            ColdWaveModel(imageURL: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQW-kvxdS9cGoIRgWd--NPRLWfJnafShVpCrw&s", instaID: "@oneyoung"),
            ColdWaveModel(imageURL: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTZZ4WkP1UFcKoXAvZgZbqoLiMaXXGt_cQiVg&s", instaID: "@sinyeeun"),
            ColdWaveModel(imageURL: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTZZ4WkP1UFcKoXAvZgZbqoLiMaXXGt_cQiVg&s", instaID: "@giselle"),
            ColdWaveModel(imageURL: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS8u-ukoYZp7u_eOGWu4mAAja1Rwtd1aljfhA&s", instaID: "@haneul"),
            ColdWaveModel(imageURL: "https://cdn.hankyung.com/photo/202307/01.33940648.1.jpg", instaID: "@haneul"),
            ColdWaveModel(imageURL: "https://image.ajunews.com/content/image/2022/09/21/20220921171527188866.jpg", instaID: "@thousand_wooo"),
            ColdWaveModel(imageURL: "https://m.weekly.cnbnews.com/data/photos/20230520/art_150711_1684374817.jpg", instaID: "@thousand_wooo"),
        ]
    }
}
