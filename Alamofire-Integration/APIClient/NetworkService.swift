//
//  NetworkService.swift
//  Alamofire-Integration
//
//  Created by Ahmed Sadiq on 25/03/2024.
//

import Foundation
import Alamofire

class NetworkService: APIClient {
    static let shared = NetworkService()
    let session: Session
    let urlRequestBuilder: URLRequestBuilder
    private(set) var baseString: String
    private init() {
        let configuration = URLSessionConfiguration.af.default
        configuration.timeoutIntervalForRequest = 30.0
        self.session = Session(configuration: configuration, interceptor: APIRequestInterceptor())
        self.baseString = APIBaseURL.getBaseUrl
        self.urlRequestBuilder = DefaultURLRequestBuilder()
    }
    func reset() {
        self.baseString = APIBaseURL.getBaseUrl
    }
}
