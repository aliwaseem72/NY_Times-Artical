//
//  ArticalVC.swift
//  NY_Times_Articals
//
//  Created by Ali Waseem on 27/07/2024.
//

import UIKit
import Combine

class ArticalVC: UIViewController {

    // ----------------------------------------------------------------------------------
    // MARK: - Outlets
    // ----------------------------------------------------------------------------------
    @IBOutlet weak var tableView: UITableView!
    
    // ----------------------------------------------------------------------------------
    // MARK: - Data members
    // ----------------------------------------------------------------------------------

    private var subscriptions: Set<AnyCancellable> = .init()
    var viewModel: ArticalVM?
    var router: ArticalRouter?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        bindViews()
        viewModel?.getArticals(timePeriod: .one)
    }

    // ----------------------------------------------------------------------------------
    // MARK: - Binding Views
    // ----------------------------------------------------------------------------------

    /**
     Binds the view model properties to the view controller's UI elements.

     This method sets up bindings for the user profile response, API error handling,
     and spinner visibility, updating the UI based on changes in the view model.
     */
    func bindViews() {
        guard let viewModel = viewModel else { return }

        viewModel.$articalResponseModel
            .receive(on: DispatchQueue.main)
            .dropFirst()
            .sink(receiveValue: { [weak self] articalResponse in
                guard let self = self else { return }
                if !(articalResponse?.results?.isEmpty ?? true) {
                    tableView.reloadData()
                }
            }).store(in: &subscriptions)

        viewModel.$apiError
            .receive(on: DispatchQueue.main)
            .dropFirst()
            .sink(receiveValue: { [weak self] error in
                guard let self = self else { return }
                let errorMessage: String

                switch error {
                case .apiError(let apiErrorResponse):
                    errorMessage = apiErrorResponse.fault?.faultString ?? error.debugDescription
                default:
                    errorMessage = error.debugDescription
                }
                self.showSimpleAlert(title: PopUpMessage.ERROR.rawValue, message: errorMessage)
            }).store(in: &subscriptions)

        viewModel.$showSpinner
            .receive(on: DispatchQueue.main)
            .sink(receiveValue: { showSpinner in
                showSpinner ? self.showLoader() : self.hideLoader()
            }).store(in: &subscriptions)
    }
}

// ----------------------------------------------------------------------------------
// MARK: - UITableView DataSorce
// ----------------------------------------------------------------------------------
extension ArticalVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel?.articalResponseModel?.results?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let currentCell = tableView.dequeueReusableCell(withIdentifier: "ArticalTableViewCell", for: indexPath)  as? ArticalTableViewCell else { return UITableViewCell() }
        guard let result = viewModel?.articalResponseModel?.results?[indexPath.row] else { return UITableViewCell() }
        currentCell.configureCell(response: result)
        return currentCell
    }
}

// ----------------------------------------------------------------------------------
// MARK: - UITableView Delegate
// ----------------------------------------------------------------------------------

extension ArticalVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        120.0
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let articalObj = viewModel?.articalResponseModel?.results?[indexPath.row]
        router?.route(to: ArticalRoute.aticalDetail.rawValue, parameters: articalObj)
    }
}


// ----------------------------------------------------------------------------------
// MARK: - Storyboarding
// ----------------------------------------------------------------------------------
extension ArticalVC: Storyboarding {
    static var storyboardName: String {
        return "Main"
    }
}
