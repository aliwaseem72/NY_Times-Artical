//
//  NetworkCallFactory.swift
//  NY_Times_Articals
//
//  Created by Ali Waseem on 27/07/2024.
//

import Foundation

/**
 A factory class for creating network calls.
 */
final class NetworkCallFactory {
}

extension NetworkCallFactory: NetworkCallFactoryProtocol {
    
    /**
     Creates a new instance of a network call.
     
     - Returns: A new instance of NetworkCall implementing the NetworkCallProtocol.
     */
    func createNetworkCall() -> NetworkCallProtocol {
        return NetworkCall()
    }
}
