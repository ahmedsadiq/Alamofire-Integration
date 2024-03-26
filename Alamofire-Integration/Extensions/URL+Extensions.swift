//
//  URL+Extensions.swift
//  Alamofire-Integration
//
//  Created by Ahmed Sadiq 25/03/2024.
//

import Foundation

extension URL {
    func appendingQueryParameters(_ parameters: [String: String]) -> URL {
        guard var components = URLComponents(url: self, resolvingAgainstBaseURL: true) else {
            return self
        }
        let queryItems = parameters.map { key, value in
            URLQueryItem(name: key, value: value)
        }
        components.queryItems = (components.queryItems ?? []) + queryItems
        return components.url ?? self
    }
}
