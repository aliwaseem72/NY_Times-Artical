//
//  ArticalRouter.swift
//  NY_Times_Articals
//
//  Created by Ali Waseem on 29/07/2024.
//


import UIKit

enum ArticalDetailRoute: String {
    case aticalDetailLink
}

class ArticalDetailRouter {
    /// A weak reference to the current view controller to perform navigation.
    weak var viewController: UIViewController?
}

extension ArticalDetailRouter: RouterProtocol {
    func route(to routeID: String, parameters: Any?) {
        // Attempt to initialize an ArticalRoute with the given routeID.
        guard let articalDetailRoute = ArticalDetailRoute(rawValue: routeID) else { return }

        // Handle routing based on the specified route.
        switch articalDetailRoute {
        case .aticalDetailLink:
            routeToArticalLinkVC(inputPrams: parameters)
            break
        }
    }
}

extension ArticalDetailRouter {
    /**
     Routes to the Artical Detail view controller.

     - Parameter inputPrams: Any parameters required to configure the login view controller.
     */
    private func routeToArticalLinkVC(inputPrams: Any?) {
        guard let (articalURL) = inputPrams as? (String) else { return }

        // Configure and obtain the login view controller.
        guard let articalDetailVC = ArticalWebLinkVcConfigurator().configureViewController(with: articalURL) as? ArticalWebLinkVC else { return }

        // Push the login view controller onto the navigation stack.
        viewController?.navigationController?.pushViewController(articalDetailVC, animated: true)
    }
}
