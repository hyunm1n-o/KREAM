//
//  SearchResponseModel.swift
//  KREAM
//
//  Created by 오현민 on 11/23/24.
//

import Foundation

// MARK: - SearchResponseModel
struct SearchResponseModel: Codable {
    let products: [Product]?
    let total, skip, limit: Int?
}

// MARK: - Product
struct Product: Codable {
    let id: Int?
    let title, description, category: String?
    let price, discountPercentage, rating: Double?
    let stock: Int?
    let tags: [String]?
    let brand, sku: String?
    let weight: Int?
    let dimensions: Dimensions?
    let warrantyInformation, shippingInformation, availabilityStatus: String?
    let reviews: [Review]?
    let returnPolicy: String?
    let minimumOrderQuantity: Int?
    let meta: Meta?
    let images: [String]?
    let thumbnail: String?
}

// MARK: - Dimensions
struct Dimensions: Codable {
    let width, height, depth: Double?
}

// MARK: - Meta
struct Meta: Codable {
    let createdAt, updatedAt, barcode: String?
    let qrCode: String?
}

// MARK: - Review
struct Review: Codable {
    let rating: Int?
    let comment, date, reviewerName, reviewerEmail: String?
}
