//
//  NetworkHandling.swift
//  C24PA
//
//  Created by Gene Dimitrow on 21.03.21.
//

import Foundation

struct NetworkHandling {

    func performNetworkTask<T: Codable>(endpoint: URL, type: T.Type, completion: ((_ response: T) -> Void)?, failure: @escaping (_ error: Error) -> Void) {

        let urlRequest = URLRequest(url: endpoint)

        let urlSession = URLSession.shared.dataTask(with: urlRequest) { receivedData, urlResponse, error in
            if let er = error {
                
                failure(er)
                return
            }
            
            guard let data = receivedData else {
                
                failure(Errors.customDescriptionError("No data received"))
                return
            }
            
            
            let jsonDecoder = JSONDecoder()
            guard let decoded = try? jsonDecoder.decode(type, from: data) else {
                
                failure(Errors.customDescriptionError("Decoding Error"))
                return
            }

            completion?(decoded)
        }

        urlSession.resume()
    }
}
