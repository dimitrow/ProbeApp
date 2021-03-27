//
//  ProductOverviewResponseModel.swift
//  C24PA
//
//  Created by Gene Dimitrow on 21.03.21.
//

import Foundation

struct ProductOverviewModel: Codable {
    
    let header: HeaderData
    let filters: [String]
    let products: [ProductModel]
}
