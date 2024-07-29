//
//  RepositoryProtocol.swift
//  NY_Times_Articals
//
//  Created by Ali Waseem on 27/07/2024.
//

import Foundation

/**
 A protocol defining the requirements for a repository object.
 */
protocol RepositoryProtocol {

    /// A network call protocol object used for making network requests.
    var network: NetworkCallProtocol { get }

    /// A parser object used for parsing data.
    var parser: Parser { get }

    /**
     Parses the response data and handles success or error cases.

     - Parameters:
     - response: The data to be parsed.
     - successHandler: A closure to be called upon successful parsing with the parsed model.
     - errorHandler: A closure to be called upon parsing error with the service error.
     */
    func parseResponse <T: Decodable>(_ response: Data,
                                      successHandler: @escaping CompletionWithSuccess<T>,
                                      errorHandler: @escaping CompletionWithServiceError)
}

extension RepositoryProtocol {

    /**
     Default implementation of parsing the response data and handling success or error cases.
     
     - Parameters:
     - response: The data to be parsed.
     - successHandler: A closure to be called upon successful parsing with the parsed model.
     - errorHandler: A closure to be called upon parsing error with the service error.
     */
    func parseResponse <T: Decodable>(_ response: Data,
                                      successHandler: @escaping CompletionWithSuccess<T>,
                                      errorHandler: @escaping CompletionWithServiceError) {

        let result = parser.parseWith(data: response, type: T.self)

        switch result {
        case .failure(_):
            let error: AppError = .unexpectedResponse
            errorHandler(error)

        case .success(let model):
            successHandler(model)
        }
    }
}
