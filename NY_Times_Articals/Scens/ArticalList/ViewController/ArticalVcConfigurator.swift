//
//  ArticalVcConfigurator.swift
//  NY_Times_Articals
//
//  Created by Ali Waseem on 28/07/2024.
//

import UIKit

class ArticalVcConfigurator: ViewControllerConfigurator {
    func configureViewController(with parameter: Any?) -> UIViewController {
        let viewController = ArticalVC.instantiate()
        let networkCall = NetworkCallFactory().createNetworkCall()
        let jsonParser = JsonParser()
        let articalRepo = ArticalRepositoryFactory().createRepository(network: networkCall, parser: jsonParser)

        // Create and assign the router
        let router = ArticalRouter()
        router.viewController = viewController
        viewController.router = router

        let viewModel = ArticalVM(articalRepository: articalRepo)
        viewController.viewModel = viewModel

        return viewController
    }

    func configureWithNavigationController() -> UINavigationController {
        let viewController = configureViewController()
        let navigationController = UINavigationController(rootViewController: viewController)
        return navigationController
    }
}

