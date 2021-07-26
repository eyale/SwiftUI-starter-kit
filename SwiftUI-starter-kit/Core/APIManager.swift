//
//  APIManager.swift
//  SwiftUI-starter-kit
//
//  Created by Anton Honcharov on 6/30/21.
//

import Foundation
import Alamofire

// https://blog.devgenius.io/how-to-build-alamofire-network-layer-with-protocol-oriented-programming-and-combine-4de005290566

protocol URLRequestBuilder: URLRequestConvertible {
  var baseURL: URL { get }
  var requestURL: URL { get }
  var path: String { get }
  var parameters: Parameters? { get }
  var method: HTTPMethod { get }
  var encoding: ParameterEncoding { get }
  var urlRequest: URLRequest { get }
}

extension URLRequestBuilder {

  var baseURL: URL {
//    return AppEnvironement.baseURL
    return baseURL
  }

  var requestURL: URL {
    return baseURL.appendingPathComponent(path, isDirectory: false)
  }

  var encoding: ParameterEncoding {
    switch method {
    case .get:
      return URLEncoding.default
    default:
      return JSONEncoding.default
    }
  }

  var headers: HTTPHeaders {
    let header = HTTPHeaders()
    return header
  }

  var urlRequest: URLRequest {
    var request = URLRequest(url: requestURL)
    request.httpMethod = method.rawValue
    headers.forEach {
      request.addValue($0.value, forHTTPHeaderField: $0.name)
    }
    return request
  }

  public func asURLRequest() throws -> URLRequest {
    return try encoding.encode(urlRequest, with: parameters)
  }
}



class APIMAnager {
  static let sharedInstance: APIMAnager = {
    let instance = APIMAnager()
    // setup code
    return instance
  }()
}
