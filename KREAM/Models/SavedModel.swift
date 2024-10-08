//
//  SavedModel.swift
//  KREAM
//
//  Created by 오현민 on 10/9/24.
//

import Foundation

struct SavedModel {
    let savedImage: String
    let savedTitle: String
    let savedDesc: String
    let savedPrice: String
}

final class dummySavedModel {
    static let savedDatas: [SavedModel] = [
        SavedModel(savedImage: "saved1", savedTitle: "손오공이 잃어버린 머리띠 반쪽", savedDesc: "손오공이 장난치다가 머리띠 반쪽 잘라서 어딘가 숨겨둔 역사속 물건!!", savedPrice: "942,192,000원"),
        SavedModel(savedImage: "saved2", savedTitle: "골드 반지", savedDesc: "결혼 준비하는 당신?!\n약혼녀에게 이 반지를 선물하는 건 어때요?!", savedPrice: "12,000원"),
        SavedModel(savedImage: "saved3", savedTitle: "하얀 신발", savedDesc: "짝퉁 나이키 신발!\n푹신푹신해서 걷다가 졸려서 넘어지...", savedPrice: "90,000원"),
        SavedModel(savedImage: "saved4", savedTitle: "에베레스트 다이아 반지", savedDesc: "에베레스트 올라가서 다이아 구하고 만든 반지,,! 과연 이것을 누가 사갈것인가??", savedPrice: "1,292,999,000원"),
        SavedModel(savedImage: "saved5", savedTitle: "아디다스다 신발", savedDesc: "아디다스 처럼 보이지만 아디다스가 아닐지도 모르는 신발 이 신발의 주인은 너야~~", savedPrice: "120,000원"),
        SavedModel(savedImage: "saved6", savedTitle: "황제 잠옷", savedDesc: "어느 나라의 황제가 입었다던 잠옷 크리스마스 트리같이 보이는 디자인!", savedPrice: "120,000,000원"),
        SavedModel(savedImage: "saved7", savedTitle: "고장난 기타", savedDesc: "블라블라블라블라\n블라블라블라블라블라", savedPrice: "120,000원"),
        SavedModel(savedImage: "saved8", savedTitle: "하얀 음료", savedDesc: "이 음료를 마시면 건강해져요\n근데 어디가 건강해질까요? 한 번 마셔겠.....", savedPrice: "120,000원")
    ]
}
