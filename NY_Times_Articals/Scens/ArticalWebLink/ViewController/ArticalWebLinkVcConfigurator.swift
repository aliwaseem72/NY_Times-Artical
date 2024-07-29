//
//  ArticalVC.swift
//  NY_Times_Articals
//
//  Created by Ali Waseem on 29/07/2024.
//

import UIKit

class ArticalWebLinkVcConfigurator: ViewControllerConfigurator {

    func configureViewController(with parameter: Any?) -> UIViewController {

        // Instantiate the view controller
        let viewController = ArticalWebLinkVC.instantiate()

        if let articalURL = parameter as? String {
            viewController.articalURL = articalURL
        }

        // Return the configured view controller
        return viewController
    }
}
