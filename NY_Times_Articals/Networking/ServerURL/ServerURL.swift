//
//  ServerURL.swift
//  NY_Times_Articals
//
//  Created by Ali Waseem on 27/07/2024.
//

import Foundation

/**
 A class representing the server URL for the NY Times API.
 */
final class ServerUrl {
    
    /// The base URL for the NY Times API
    static var baseURL: String = "http://api.nytimes.com/"
    
    /// Enum defining different endpoints for the API
    enum EndPoint: String {
        case mostViewedArticals = "svc/mostpopular/v2/mostviewed/all-sections/%d.json?api-key=LqYU9LLaRD9MSrSXXWtbru4mSxsLArAD"
    }
}
