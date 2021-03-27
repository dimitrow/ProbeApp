//
//  ProductsCellDirector.swift
//  C24PA
//
//  Created by Gene Dimitrow on 21.03.21.
//

import UIKit

class ProductsCellDirector {

    static func createProductCell(for tableView: UITableView, with product: ProductModel?) -> UITableViewCell {
        
        if let productModel = product {
            
            if productModel.available == true {
                
                return ProductAvaliableCellBuilder().buildCell(for: tableView, productModel: productModel)
            } else {
                
                return ProductUnavaliableCellBuilder().buildCell(for: tableView, productModel: productModel)
            }
        }
        
        return UITableViewCell()
    }
    
}
