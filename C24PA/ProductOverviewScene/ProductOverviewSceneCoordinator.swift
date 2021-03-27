//
//  ProductOverviewSceneCoordinator.swift
//  C24PA
//
//  Created by Gene Dimitrow on 21.03.21.
//

import UIKit

class ProductOverviewSceneCoordinator: SceneSetupProtocol {

    var viewController: ProductOverviewViewController?
    
    func setUpScene<T>() -> T where T: ReusableView {
        
        self.viewController = UIStoryboard(name: "ProductOverviewStoryboard", bundle: nil).instantiateViewController()
        self.viewController?.viewModel = ProductOverviewSceneViewModel(view: viewController!, coordinator: self)
        return viewController as! T
    }
    
}

extension ProductOverviewSceneCoordinator: ProductOverviewSceneCoordinatorProtocol {
    
    
    
}
