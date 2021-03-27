//
//  ProductOverviewViewController.swift
//  C24PA
//
//  Created by Gene Dimitrow on 21.03.21.
//

import UIKit
import MBProgressHUD

class ProductOverviewViewController: UIViewController {
    
    @IBOutlet weak var productOverviewTableView: UITableView!
    @IBOutlet weak var filterSegmentedControl: UISegmentedControl!
    
    var viewModel: ProductOverviewSceneViewModelProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Probeaufgabe"
        
        productOverviewTableView.register(UINib.init(nibName: "ProductAvaliableCell", bundle: nil), forCellReuseIdentifier: "ProductAvaliableCell")
        productOverviewTableView.register(UINib.init(nibName: "ProductUnavaliableCell", bundle: nil), forCellReuseIdentifier: "ProductUnavaliableCell")
        
        productOverviewTableView.rowHeight = UITableView.automaticDimension
        productOverviewTableView.tableFooterView = UIView()
        
        filterSegmentedControl.setTitle(FilterType.All.rawValue, forSegmentAt: 0)
        filterSegmentedControl.setTitle(FilterType.Avaliable.rawValue, forSegmentAt: 1)
        filterSegmentedControl.setTitle(FilterType.Favorites.rawValue, forSegmentAt: 2)
        
        self.fetchProductsFiltered(by: .All)
        
    }
    
    @IBAction func filterTypeChangedAction(_ sender: UISegmentedControl) {
        
        print(sender.selectedSegmentIndex)
        switch sender.selectedSegmentIndex {
        case 1:
            self.fetchProductsFiltered(by: .Avaliable)
            break
        case 2:
            self.fetchProductsFiltered(by: .Favorites)
            break
        default:
            self.fetchProductsFiltered(by: .All)
            break
        }
    }
    
    private func fetchProductsFiltered(by filterType: FilterType) {
        
        MBProgressHUD.showAdded(to: self.view, animated: true)
        
        viewModel?.fetchProductsList(with: filterType, completion: { [weak self] in
            
            DispatchQueue.main.async {
                
                self?.productOverviewTableView.delegate = self
                self?.productOverviewTableView.dataSource = self
                
                MBProgressHUD.hide(for: (self?.view)!, animated: true)
                self?.productOverviewTableView.reloadData()
            }
            
        })
    }
    
    func routeToProductDetails(_ product: ProductModel) {
        
        print(product)
    }
}

extension ProductOverviewViewController: ProductOverviewViewDelegate {
        
    func operationFailed(_ error: Error) {
        
        DispatchQueue.main.async { [weak self] in
            
            MBProgressHUD.hide(for: (self?.view)!, animated: true)
            self?.showAlertView(error.localizedDescription)
        }
    }
}
