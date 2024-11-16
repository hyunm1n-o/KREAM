//
//  SizeModel.swift
//  KREAM
//
//  Created by 오현민 on 11/2/24.
//

import Foundation

struct SizeModel {
    let size : String
}

extension SizeModel {
    static func dummy() -> [SizeModel] {
        return [
            SizeModel(size: "S"),
            SizeModel(size: "M"),
            SizeModel(size: "L"),
            SizeModel(size: "XL"),
            SizeModel(size: "XXL")
        ]
    }
}
