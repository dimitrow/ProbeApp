//
//  ProductAvaliableCellBuilder.swift
//  C24PA
//
//  Created by Gene Dimitrow on 21.03.21.
//

import UIKit
import SDWebImage

class ProductAvaliableCellBuilder {
    
    func buildCell(for tableView: UITableView, productModel: ProductModel) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProductAvaliableCell") as! ProductAvaliableCell
        
        let imageURL = URL(string: productModel.imageURL)
        
        cell.productPreviewIcon.sd_setImage(with: imageURL, placeholderImage: nil) { (image, error, cache, url) in
            
            if let myImage = image {
                
                let tintableImage = myImage.withRenderingMode(.alwaysTemplate)
                cell.productPreviewIcon.image  = tintableImage
                cell.productPreviewIcon.tintColor = UIColor(hex: "#\(productModel.colorCode)") // doesn't work, and damn, wasted too much time on it
                
            }
        }
        
        cell.productNameLabel.text = productModel.name
        cell.descriptionLabel.text = productModel.description
        
        cell.priceLabel.text = "Preis: \(productModel.price.value) \(productModel.price.currency)"
        
        let releaseDate = productModel.releaseDate
        
        let date = Date(timeIntervalSince1970: TimeInterval(releaseDate))
        
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "de-DE")
        dateFormatter.dateFormat = "d.MM.yyyy"
        
        dateFormatter.string(from: date)
        
        let dateString = dateFormatter.string(from: date)
        cell.dateLabel.text = dateString
        
        return cell
    }
}


