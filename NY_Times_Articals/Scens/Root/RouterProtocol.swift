//
//  RouterProtocol.swift
//  NY_Times_Articals
//
//  Created by Ali Waseem on 28/07/2024.
//

import UIKit

// This protocol defines the methods that a router object should implement in order to handle navigation within an app.
protocol RouterProtocol {
    // The view controller that the router is currently managing
    var viewController: UIViewController? { get set }

    // Dismisses the current view controller
    func dismiss(animated: Bool)

    // Pops the current view controller from the navigation stack
    func pop(animated: Bool)

    // Pops to a specific view controller in the navigation stack
    func pop(to toViewController: UIViewController, animated: Bool)

    // Pops all view controllers to the root view controller in the navigation stack
    func popToRoot(animated: Bool)

    // Routes to a specific route ID with optional parameters
    func route(to routeID: String, parameters: Any?)
}

extension RouterProtocol {
    // Default implementation for dismissing the current view controller
    func dismiss(animated: Bool) {
        viewController?.dismiss(animated: animated)
    }

    // Default implementation for popping the current view controller from the navigation stack
    func pop(animated: Bool) {
        viewController?.navigationController?.popViewController(animated: animated)
    }

    // Default implementation for popping to a specific view controller in the navigation stack
    func pop(to toViewController: UIViewController, animated: Bool) {
        viewController?.navigationController?.popToViewController(toViewController, animated: animated)
    }

    // Default implementation for popping all view controllers to the root view controller in the navigation stack
    func popToRoot(animated: Bool) {
        viewController?.navigationController?.popToRootViewController(animated: animated)
    }
}
