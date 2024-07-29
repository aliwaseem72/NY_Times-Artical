//
//  ArticalRequestModel.swift
//  NY_Times_Articals
//
//  Created by Ali Waseem on 27/07/2024.
//

import Foundation

/**
 A struct representing a model for an article request.

 This struct conforms to the Codable protocol, allowing it to be encoded and decoded from JSON.
 */
struct ArticalRequestModel: Codable {
    var timePeriod: TimePeriod

    /**
     Initializes an instance of the ArticleRequestModel with a specified time period.

     - Parameter timePeriod: The time period for the article request. Defaults to .default.
     */
    init(timePeriod: TimePeriod = .default) {
        self.timePeriod = timePeriod
    }
}

/**
 An enum representing different time periods for article requests.

 Each case corresponds to a different time period in days.
 */
enum TimePeriod: Int, Codable {
    case one = 1
    case seven = 7
    case thirty = 30

    // Provide a default value
    static let `default` = TimePeriod.one
}
