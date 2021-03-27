//
//  Errors.swift
//  C24PA
//
//  Created by Gene Dimitrow on 21.03.21.
//

import Foundation

enum Errors: Error {
    
    case missedData
    case customDescriptionError(_ description: String)
}

extension Errors: LocalizedError {
    
    var errorDescription: String? {
        switch self {
        case .missedData:
            return "No data received"
        case .customDescriptionError(let description):
            return description
        }
    }
}
