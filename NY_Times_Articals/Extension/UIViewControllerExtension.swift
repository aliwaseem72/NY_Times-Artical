//
//  UIViewControllerExtension.swift
//  NY_Times_Articals
//
//  Created by Ali Waseem on 28/07/2024.
//

import UIKit

protocol Loader {
    func showLoader()
    func hideLoader()
}

extension UIViewController: Loader {
    // MARK: - Simple Alert
    func showSimpleAlert(title: String!, message: String!, buttonTitle: String = "Ok") {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: buttonTitle, style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }


    private struct LoaderConstants {
        static var loaderViewTag = 99999
    }

    func showLoader() {
        if let _ = view.viewWithTag(LoaderConstants.loaderViewTag) {
            // Loader is already showing
            return
        }

        let loaderView = UIView(frame: view.bounds)
        loaderView.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        loaderView.tag = LoaderConstants.loaderViewTag

        let activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator.center = loaderView.center
        activityIndicator.startAnimating()

        loaderView.addSubview(activityIndicator)
        view.addSubview(loaderView)
    }

    func hideLoader() {
        if let loaderView = view.viewWithTag(LoaderConstants.loaderViewTag) {
            loaderView.removeFromSuperview()
        }
    }
}
