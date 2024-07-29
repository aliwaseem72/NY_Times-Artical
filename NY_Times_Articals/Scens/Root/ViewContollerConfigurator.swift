//
//  ViewContollerConfigurator.swift
//  NY_Times_Articals
//
//  Created by Ali Waseem on 28/07/2024.
//

import UIKit

protocol ViewControllerConfigurator {
    func configureViewController(with parameter: Any?) -> UIViewController
}

extension ViewControllerConfigurator {
    func configureViewController() -> UIViewController {
        return configureViewController(with: nil)
    }
}
