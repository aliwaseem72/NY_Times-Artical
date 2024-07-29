//
//  AppError.swift
//  NY_Times_Articals
//
//  Created by Ali Waseem on 27/07/2024.
//

import Foundation

/**
 Enum representing different types of errors that can occur in the app.
 
 - serverError: An error occurred on the server side.
 - apiError: An error response was received from the API.
 - unexpectedResponse: An unexpected response was received from the server.
 - unknown: An unknown error occurred.
 - noNetwork: No internet connection is available.
 */
enum AppError: Error {
    case serverError(Error)
    case apiError(ApiErrorResponseModel)
    case unexpectedResponse
    case unknown
    case noNetwork
}

extension AppError: CustomDebugStringConvertible {
    /**
     A textual representation of this instance, suitable for debugging.
     
     Returns a string describing the error based on its type.
     
     - Returns: A string describing the error.
     */
    public var debugDescription: String {
        switch self {
        case .serverError(let error):
            return error.localizedDescription
        case .unexpectedResponse:
            return "Unexpected Response From Server"
        case .unknown:
            return UNKNOWN_ERROR_MESSAGE
        case .apiError(let apiErrorResponse):
            return apiErrorResponse.fault?.errorMessage ?? UNKNOWN_ERROR_MESSAGE
        case .noNetwork:
            return "No Internet Connection"
        }
    }
}
