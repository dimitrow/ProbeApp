//
//  ProductAvaliableCell.swift
//  C24PA
//
//  Created by Gene Dimitrow on 21.03.21.
//

import UIKit

class ProductAvaliableCell: UITableViewCell {

    @IBOutlet weak var productPreviewIcon: UIImageView!
    @IBOutlet weak var cellFramingView: UIView!
    
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var priceLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        cellFramingView.layer.backgroundColor = UIColor.white.cgColor
        cellFramingView.layer.borderColor = UIColor.lightGray.cgColor
        cellFramingView.layer.borderWidth = 2.0
        cellFramingView.layer.cornerRadius = 6.0

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
