//
//  ProductUnavaliableCellBuilder.swift
//  C24PA
//
//  Created by Gene Dimitrow on 21.03.21.
//

import UIKit
import SDWebImage

class ProductUnavaliableCellBuilder {

    func buildCell(for tableView: UITableView, productModel: ProductModel) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProductUnavaliableCell") as! ProductUnavaliableCell

        let imageURL = URL(string: productModel.imageURL)
        
        cell.productIcon.sd_setImage(with: imageURL, placeholderImage: nil) { (image, error, cache, url) in
            
            if let myImage = image {
                
                let tintableImage = myImage.withRenderingMode(.alwaysTemplate)
                cell.productIcon.image  = tintableImage
                cell.productIcon.tintColor = UIColor(hex: "#\(productModel.colorCode)")
                
            }
        }
        
        cell.productNameLabel.text = productModel.name
        
        return cell
    }
    
}
