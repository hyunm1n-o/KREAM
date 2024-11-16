//
//  DetailModel.swift
//  KREAM
//
//  Created by 오현민 on 11/2/24.
//

import Foundation
import UIKit

struct DetailModel {
    let image : UIImage
}

extension DetailModel {
    static func dummy() -> [DetailModel] {
        return [
            DetailModel(image: ._1),
            DetailModel(image: ._2),
            DetailModel(image: ._3),
            DetailModel(image: ._4),
            DetailModel(image: ._5),
            DetailModel(image: ._6),
            DetailModel(image: ._7)
        ]
    }
}





