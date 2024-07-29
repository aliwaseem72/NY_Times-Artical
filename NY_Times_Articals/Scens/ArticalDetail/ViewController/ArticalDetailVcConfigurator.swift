//
//  ArticalRouter.swift
//  NY_Times_Articals
//
//  Created by Ali Waseem on 29/07/2024.
//

import UIKit

class ArticalDetailVcConfigurator: ViewControllerConfigurator {

    func configureViewController(with parameter: Any?) -> UIViewController {

        // Instantiate the view controller
        let viewController = ArticalDetailVC.instantiate()

        // Create and assign the router
        let router = ArticalDetailRouter()
        router.viewController = viewController
        viewController.router = router

        if let articalObj = parameter as? ArticalResult {
            viewController.articalObj = articalObj
        }
        
        // Return the configured view controller
        return viewController
    }
}
