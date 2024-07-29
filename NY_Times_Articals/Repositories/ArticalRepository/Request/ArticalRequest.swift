//
//  ArticalRequest.swift
//  NY_Times_Articals
//
//  Created by Ali Waseem on 27/07/2024.
//

import Foundation

class ArticalRequest: RequestProtocol {
    init(timePeriod: TimePeriod) {
        self.timePeriod = timePeriod
    }

    typealias Response = ArticalResponseModel
    typealias ErrorType = AppError
    var method: HTTPMethod = .get
    var path: String {
        return String(format: ServerUrl.EndPoint.mostViewedArticals.rawValue, timePeriod.rawValue)
    }
    let timePeriod: TimePeriod
    var parameters: Parameters?
    var encoding: RequestEncoding = .url
}
