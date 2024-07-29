//
//  ArticalRepositoryFactory.swift
//  NY_Times_Articals
//
//  Created by Ali Waseem on 28/07/2024.
//

import Foundation

/**
 A factory class for creating instances of `ArticalRepository`.
 */
final class ArticalRepositoryFactory {

    /// Type alias for `ArticalRepository`
    typealias Repository = ArticalRepository

    /**
     Creates an instance of `ArticalRepository` using the provided network call protocol and parser.

     - Parameters:
     - network: The network call protocol used for making network requests.
     - parser: The parser used for parsing data received from the network.

     - Returns: An instance of `ArticalRepository` created with the provided network and parser.
     */
    func createRepository(network: NetworkCallProtocol, parser: Parser) -> ArticalRepository {
        return ArticalRepositoryImpl(network: network, parser: parser)
    }
}
