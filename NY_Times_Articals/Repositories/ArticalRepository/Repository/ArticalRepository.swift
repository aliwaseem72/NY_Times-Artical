//
//  ArticalRepository.swift
//  NY_Times_Articals
//
//  Created by Ali Waseem on 28/07/2024.
//

import Foundation

/**
 Protocol for defining methods to interact with a repository of articles.
 */
protocol ArticalRepository {

    /**
     Retrieves the most viewed articles based on the provided request model.

     - Parameters:
     - requestModel: The model containing information needed to make the request.
     - successHandler: A closure to be called upon successful retrieval of articles.
     - errorHandler: A closure to be called if an error occurs during retrieval.
     */
    func getMostViewedArticals(requestModel: ArticalRequestModel, successHandler: @escaping CompletionWithSuccess<ArticalRequest.Response>, errorHandler: @escaping CompletionWithServiceError)
}

/**
 Implementation of the ArticalRepository protocol that interacts with a network and parser.
 */
class ArticalRepositoryImpl: RepositoryProtocol {

    let network: NetworkCallProtocol
    let parser: Parser

    /**
     Initializes an instance of ArticalRepositoryImpl with the provided network and parser objects.

     - Parameters:
     - network: The network object used for making requests.
     - parser: The parser object used for parsing responses.
     */
    init(network: NetworkCallProtocol, parser: Parser) {
        self.network = network
        self.parser = parser
    }
}

extension ArticalRepositoryImpl: ArticalRepository {
    /**
     Retrieves the most viewed articles based on the provided request model using the network object and calls appropriate handlers based on result.

     - Parameters:
     - requestModel: The model containing information needed to make the request.
     - successHandler: A closure to be called upon successful retrieval of articles.
     - errorHandler: A closure to be called if an error occurs during retrieval.
     */
    func getMostViewedArticals(requestModel: ArticalRequestModel, successHandler: @escaping CompletionWithSuccess<ArticalRequest.Response>, errorHandler: @escaping CompletionWithServiceError) {

        let request = ArticalRequest(timePeriod: requestModel.timePeriod)
        // Make a network request using the provided request object
        network.request(request) { [weak self] result in
            switch result {
            case .success(let response):
                // Parse and handle successful response
                self?.parseResponse(response, successHandler: successHandler, errorHandler: errorHandler)
            case .failure(let error):
                // Handle error by calling error handler
                errorHandler(error)
            }
        }
    }
}
