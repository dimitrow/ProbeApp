//
//  ProductModel.swift
//  C24PA
//
//  Created by Gene Dimitrow on 21.03.21.
//

import Foundation

struct ProductModel: Codable {
    
    let name: String
    let type: String
    let id: Int
    let color: String
    let imageURL: String
    let colorCode: String
    let available: Bool
    let releaseDate: Int
    let description: String
    let longDescription: String
    let rating: Double
    let price: ProductPrice
}
