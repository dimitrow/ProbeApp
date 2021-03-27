//
//  ProductOverviewViewModel.swift
//  C24PA
//
//  Created by Gene Dimitrow on 21.03.21.
//

import UIKit

class ProductOverviewSceneViewModel {

    weak var view: ProductOverviewViewDelegate?
    var coordinator: ProductOverviewSceneCoordinatorProtocol
        
    private let networkHandling = NetworkHandling()
    internal var overviewModel: ProductOverviewModel?
    
    init(view: ProductOverviewViewDelegate, coordinator: ProductOverviewSceneCoordinatorProtocol) {
        
        self.view = view
        self.coordinator = coordinator
    }
}

extension ProductOverviewSceneViewModel: ProductOverviewSceneViewModelProtocol {
        
    var productOverviewModel: ProductOverviewModel? {
        
        return self.overviewModel
    }
    
    func fetchProductsList(with filter: FilterType, completion: @escaping () -> Void) {
        
        networkHandling.performNetworkTask(endpoint: ProductOverviewAPI.baseURL, type: ProductOverviewModel.self) { [weak self] response in
                        
            self?.overviewModel = self?.filterPruducts(by: filter, inputModel: response)
            
            guard let products = self?.overviewModel?.products, !products.isEmpty else {
                
                self?.view?.operationFailed(Errors.customDescriptionError("Nothing found"))
                completion()
                return
            }
            
            completion()
        } failure: { [weak self] error in
            
            self?.view?.operationFailed(error)
        }
    }
    
    private func filterPruducts(by filterType: FilterType, inputModel: ProductOverviewModel) -> ProductOverviewModel {
        
        switch filterType {
        case .Avaliable:
            
            let avaliableProducts = inputModel.products.filter({$0.available == true})
            let productOverviewModel = ProductOverviewModel(header: inputModel.header, filters: inputModel.filters, products: avaliableProducts)

            return productOverviewModel
        case .Favorites:
            
            let productOverviewModel = ProductOverviewModel(header: inputModel.header, filters: inputModel.filters, products: [])
            return productOverviewModel
        default:
            return inputModel
        }
    }
    
}
