//
//  ArticalRouter.swift
//  NY_Times_Articals
//
//  Created by Ali Waseem on 28/07/2024.
//

import UIKit

enum ArticalRoute: String {
    case aticalDetail
}

class ArticalRouter {
    /// A weak reference to the current view controller to perform navigation.
    weak var viewController: UIViewController?
}

extension ArticalRouter: RouterProtocol {
    func route(to routeID: String, parameters: Any?) {
        // Attempt to initialize an ArticalRoute with the given routeID.
        guard let articalRoute = ArticalRoute(rawValue: routeID) else { return }

        // Handle routing based on the specified route.
        switch articalRoute {
        case .aticalDetail:
            routeToArticalDetailVC(inputPrams: parameters)
            break
        }
    }
}

extension ArticalRouter {
    /**
     Routes to the Artical Detail view controller.

     - Parameter inputPrams: Any parameters required to configure the login view controller.
     */
    private func routeToArticalDetailVC(inputPrams: Any?) {
        guard let (articalObj) = inputPrams as? (ArticalResult) else { return }

        // Configure and obtain the login view controller.
        guard let articalDetailVC = ArticalDetailVcConfigurator().configureViewController(with: articalObj) as? ArticalDetailVC else { return }

        // Push the login view controller onto the navigation stack.
        viewController?.navigationController?.pushViewController(articalDetailVC, animated: true)
    }
}
