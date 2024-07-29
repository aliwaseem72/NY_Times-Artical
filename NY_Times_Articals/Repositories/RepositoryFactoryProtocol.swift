//
//  RepositoryProtocol.swift
//  NY_Times_Articals
//
//  Created by Ali Waseem on 27/07/2024.
//

import Foundation

/**
 A protocol for creating repositories.
 */
protocol RepositoryFactoryProtocol {

    // Associated type for the repository
    associatedtype Repository

    /**
     Creates a repository using the provided network call and parser.

     - Parameters:
     - network: The network call protocol used to make API requests.
     - parser: The parser used to parse API responses.

     - Returns: A repository of the associated type.
     */
    func createRepository(network: NetworkCallProtocol, parser: Parser) -> Repository
}
