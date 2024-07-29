//
//  ArticalVM.swift
//  NY_Times_Articals
//
//  Created by Ali Waseem on 28/07/2024.
//

import Foundation

class ArticalVM {

    /**
     A published variable that stores any API errors that occur during network requests.
     */
    @Published var apiError: AppError?

    /**
     A published variable that determines whether a spinner should be displayed to indicate loading.
     */
    @Published var showSpinner: Bool = true

    /**
     A published variable that stores the response model for articles retrieved from the API.
     */
    @Published var articalResponseModel: ArticalResponseModel?

    /**
     The repository responsible for fetching article data from the API.
     */
    private let articalRepository: ArticalRepository

    /**
     Initializes the ViewModel with a given `ArticalRepository`.
     - Parameter articalRepository: The repository responsible for fetching article data.
     */
    init(articalRepository: ArticalRepository) {
        self.articalRepository = articalRepository
    }

    /**
     Fetches articles based on a specified time period and updates the ViewModel's properties accordingly.
     - Parameter timePeriod: The time period for which to fetch articles.
     */
    func getArticals(timePeriod: TimePeriod) {
        showSpinner = true
        articalRepository.getMostViewedArticals(requestModel: ArticalRequestModel(timePeriod: timePeriod)) { [unowned self] model in
            showSpinner = false
            articalResponseModel = model
        } errorHandler: { [unowned self] error in
            showSpinner = false
            apiError = error
        }
    }
}
