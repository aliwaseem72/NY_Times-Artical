//
//  HTTPMethod.swift
//  NY_Times_Articals
//
//  Created by Ali Waseem on 27/07/2024.
//

import Foundation

// Define a typealias HttpHeaders as a dictionary with String keys and values
typealias HttpHeaders = [String: String]

// Define a typealias Parameters as a dictionary with String keys and Any values
typealias Parameters = [String: Any]

// Define an enum HTTPMethod with cases for different HTTP methods
enum HTTPMethod {
    case get, post, put, patch, delete

    // Computed property to return the corresponding HTTP method string for each case
    var urlMethod: String {
        switch self {
        case .get:
            return "GET"
        case .post:
            return "POST"
        case .put:
            return "PUT"
        case .patch:
            return "PATCH"
        case .delete:
            return "DELETE"
        }
    }
}

// Define an enum RequestEncoding with cases for different request encodings
enum RequestEncoding {
    case url
    case json
}
