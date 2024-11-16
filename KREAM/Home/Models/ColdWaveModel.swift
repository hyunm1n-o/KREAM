//
//  ColdWaveModel.swift
//  KREAM
//
//  Created by 오현민 on 10/16/24.
//

import Foundation
import UIKit

struct ColdWaveModel {
    let image: UIImage
    let instaID: String
}

extension ColdWaveModel {
    static func dummy() -> [ColdWaveModel] {
        return [
            ColdWaveModel(image: .coldWave1, instaID: "@katarinabluu"),
            ColdWaveModel(image: .coldWave2, instaID: "@imwinter"),
            ColdWaveModel(image: .coldWave3, instaID: "@thousand_wooo")
        ]
    }
}
