//
//  APIRequestInterceptor.swift
//  Alamofire-Integration
//
//  Created by Ahmed Sadiq on 25/03/2024.
//

import Foundation
import Alamofire

class APIRequestInterceptor: RequestInterceptor {
    func adapt(
        _ urlRequest: URLRequest, for session: Session,
        completion: @escaping (Result<URLRequest, Error>) -> Void) {
            var request = urlRequest
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            // Add all HTTP Headers
            completion(.success(request))
        }
}
