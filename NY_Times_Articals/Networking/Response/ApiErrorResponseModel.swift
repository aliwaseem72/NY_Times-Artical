//
//  ApiErrorResponseModel.swift
//  NY_Times_Articals
//
//  Created by Ali Waseem on 27/07/2024.
//

import Foundation

/**
 A struct representing the response model for API errors.
 */
struct ApiErrorResponseModel: Codable {
    let fault: FaultResponseModel?

    enum CodingKeys: String, CodingKey {
        case fault
    }
}

/**
 A struct representing the response model for fault errors.
 */
struct FaultResponseModel: Codable {
    let faultString: String?
    let detail: DetailResponseModel?

    enum CodingKeys: String, CodingKey {
        case faultString
        case detail
    }

    var errorMessage: String {
        return faultString ?? UNKNOWN_ERROR_MESSAGE
    }
}

/**
 A struct representing the response model for detailed errors.
 */
struct DetailResponseModel: Codable {
    let errorcode: String?

    enum CodingKeys: String, CodingKey {
        case errorcode
    }
}
