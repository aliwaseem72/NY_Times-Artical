//
//  RequestProtocol.swift
//  NY_Times_Articals
//
//  Created by Ali Waseem on 27/07/2024.
//

import Foundation

// This protocol defines the requirements for a network request
protocol RequestProtocol {

    // The response type must conform to Decodable
    associatedtype Response: Decodable

    // The error type must conform to Error
    associatedtype ErrorType: Error
    
    // The base URL for the request
    var baseURL: String { get }
    
    // The HTTP method for the request (GET, POST, etc.)
    var method: HTTPMethod { get }
    
    // The encoding type for the request (URL, JSON, etc.)
    var encoding: RequestEncoding { get }
    
    // The path component of the URL for the request
    var path: String { get }
    
    // Optional parameters for the request
    var parameters: Parameters? { get }
    
    // Optional headers for the request
    var headers: HttpHeaders? { get }
    
    // The full URL for the request
    var url: URL { get }
}

extension RequestProtocol {
    
    // Default headers with content type set to application/json
    var headers: HttpHeaders? { [CONTENT_TYPE: APP_JSON] }
    
    // Default base URL using ServerUrl.baseURL
    var baseURL: String {
        return ServerUrl.baseURL
    }
    
    // Default URL constructed by combining baseURL and path components
    var url: URL {
        return URL(string: baseURL + path)!
    }
    
    // Default encoding type as .url
    var encoding: RequestEncoding {
        return .url
    }
}
