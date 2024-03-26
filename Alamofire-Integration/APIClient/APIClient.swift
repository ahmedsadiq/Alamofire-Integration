//
//  APIClient.swift
//  Alamofire-Integration
//
//  Created by Ahmed Sadiq on 25/03/2024.
//

import Foundation
import Alamofire

protocol APIClient {
    var session: Session { get }
    var baseString: String { get }
    var urlRequestBuilder: URLRequestBuilder { get }
    func request<T: Decodable>(
        path: String,
        parameters: [String: Any],
        queryParameters: [String: String]?,
        method: HTTPMethod,
        completion: @escaping (Result<T, Error>) -> Void
    )
}
extension APIClient {
    func request<T: Decodable>(
        path: String,
        parameters: [String: Any] = [:],
        queryParameters: [String: String]? = nil,
        method: HTTPMethod,
        completion: @escaping (Result<T, Error>) -> Void
    ) {
        do {
            let request = try urlRequestBuilder.buildURLRequest(
                for: self.baseString,
                path: path,
                queryParameters: queryParameters,
                method: method,
                parameters: parameters)
            debugPrint("API Request: ", request)
            session.request(request)
                .validate()
                .responseDecodable(of: T.self, decoder: APIClientHelper.customDecoder) { response in
                    switch response.result {
                    case .success(let value):
                        completion(.success(value))
                    case .failure(let error):
                        completion(.failure(error))
                    }
                }
        } catch {
            completion(.failure(error))
        }
    }
}
