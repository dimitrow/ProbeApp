//
//  ProductOverviewTableViewExtensions.swift
//  C24PA
//
//  Created by Gene Dimitrow on 21.03.21.
//

import UIKit

extension ProductOverviewViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        self.productOverviewTableView?.deselectRow(at: indexPath, animated: true)
        
        if let product = viewModel?.productOverviewModel?.products[indexPath.row] {
            
            self.routeToProductDetails(product)
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let headerView = UIView(frame: CGRect(x: 15.0, y: 0.0, width: tableView.frame.width, height: 70.0))
        
        let titleLabel = UILabel(frame: CGRect(x: 15.0, y: 0.0, width: tableView.frame.width, height: 35.0))
        titleLabel.text = viewModel?.productOverviewModel?.header.headerTitle
        titleLabel.numberOfLines = 1
        headerView.addSubview(titleLabel)
        
        let subTitleLabel = UILabel(frame: CGRect(x: 15.0, y: 35.0, width: tableView.frame.width, height: 35.0))
        subTitleLabel.text = viewModel?.productOverviewModel?.header.headerDescription
        subTitleLabel.numberOfLines = 1
        headerView.addSubview(subTitleLabel)
        
        headerView.backgroundColor = .white
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        
        let footerView = UIView(frame: CGRect(x: 15.0, y: 0.0, width: tableView.frame.width, height: 50.0))
        footerView.backgroundColor = .white
        let titleLabel = UILabel(frame: footerView.frame)
        titleLabel.text = "© 2020 Check24"
        titleLabel.numberOfLines = 1
        footerView.addSubview(titleLabel)
        
        return footerView
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        
        return 50
    }
}

extension ProductOverviewViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return viewModel?.productOverviewModel?.products.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = ProductsCellDirector.createProductCell(for: tableView, with: viewModel?.productOverviewModel?.products[indexPath.row])
        return cell
    }
}
