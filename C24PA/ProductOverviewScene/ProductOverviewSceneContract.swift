//
//  ProductOverviewSceneContract.swift
//  C24PA
//
//  Created by Gene Dimitrow on 21.03.21.
//

import Foundation

protocol ProductOverviewViewDelegate: class {
    
    func operationFailed(_ error: Error)
}

protocol ProductOverviewSceneViewModelProtocol: class {
    
    var productOverviewModel: ProductOverviewModel? { get }
    
    func fetchProductsList(with filter: FilterType, completion: @escaping () -> Void)
}

protocol ProductOverviewSceneCoordinatorProtocol: class {
    
}
