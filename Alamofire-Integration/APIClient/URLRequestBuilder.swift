//
//  URLRequestBuilder.swift
//  Alamofire-Integration
//
//  Created by Ahmed Sadiq on 25/03/2024.
//

import Foundation
import Alamofire

protocol URLRequestBuilder {
    func buildURLRequest(
        for baseURL: String,
        path: String,
        queryParameters: [String: String]?,
        method: HTTPMethod,
        parameters: [String: Any]
    ) throws -> URLRequest
}
extension URLRequestBuilder {
    func buildURLRequest(
        for baseURL: String,
        path: String,
        queryParameters: [String: String]? = nil,
        method: HTTPMethod,
        parameters: [String: Any] = [:]
    ) throws -> URLRequest {
        let fullPath = baseURL + path
        guard var url = URL(string: fullPath) else {
            throw AFError.invalidURL(url: fullPath)
        }
        if let query = queryParameters {
            url = url.appendingQueryParameters(query)
        }
        var request = URLRequest(url: url)
        request.method = method
        if method == .get {
            request = try URLEncoding.default.encode(request, with: parameters)
        } else {
            request = try JSONEncoding.default.encode(request, with: parameters)
        }
        return request
    }
}
struct DefaultURLRequestBuilder: URLRequestBuilder {}
