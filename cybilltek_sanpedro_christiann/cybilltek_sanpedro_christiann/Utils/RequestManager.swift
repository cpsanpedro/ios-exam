//
//  RequestManager.swift
//  SampleCoreDataBridge
//
//  Created by Christiann Carlos San Pedro on 07/07/2017.
//  Copyright © 2017 Christiann Carlos San Pedro. All rights reserved.
//




import UIKit
import Foundation
import Alamofire

public enum RequestManager: URLRequestConvertible {
    
    static let baseUrlPath = "https://cpsanpedro.000webhostapp.com/"
//    static let username = "madalicious-ios"
//    static let password = "61fe325c61b5d50895a7169b08ed4890e5622dfe"
//    static let apiKey = "9bcb7abf1710ea62bbdcaeaa32b848b0a13abdef"
  
    case post(String, withParameter:Parameters)
    case get(String, withParameter:Parameters)
    
    public func asURLRequest() throws -> URLRequest {
        var reqMethod: (method:String, path:String, params:Parameters) {
            switch self {
            case let .post(path, params):
                return ("POST", path, params)
            case let .get(path, params):
                return ("GET", path, params)
            }
        }
        
//        var headers: Dictionary = [String:String]()
      
//        if let authorizationHeader = Request.authorizationHeader(user: RequestManager.username, password: RequestManager.password) {
//            headers[authorizationHeader.key] = authorizationHeader.value
//        }
      
//        headers["X-API-KEY"] = RequestManager.apiKey
  
        let url = try RequestManager.baseUrlPath.asURL()
        
        var customRequest = URLRequest(url: url.appendingPathComponent(reqMethod.path))
        customRequest.httpMethod = reqMethod.method
//        customRequest.allHTTPHeaderFields = headers

        let urlRequest = try URLEncoding.default.encode(customRequest, with: reqMethod.params)
        
        return urlRequest
    }
    
}

