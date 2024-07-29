//
//  NetworkProtocol.swift
//  NY_Times_Articals
//
//  Created by Ali Waseem on 27/07/2024.
//

import Foundation

// This protocol defines a factory for creating network calls

protocol NetworkCallFactoryProtocol {
    
    // This method creates a network call and returns an object conforming to the NetworkCallProtocol
    func createNetworkCall() -> NetworkCallProtocol
}
