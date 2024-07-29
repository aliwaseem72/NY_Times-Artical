//
//  ArticalVC.swift
//  NY_Times_Articals
//
//  Created by Ali Waseem on 29/07/2024.
//

import UIKit
import WebKit

class ArticalWebLinkVC: UIViewController {

    // ----------------------------------------------------------------------------------
    // MARK: - Outlets
    // ----------------------------------------------------------------------------------
    
    @IBOutlet weak var webView: WKWebView!

    // ----------------------------------------------------------------------------------
    // MARK: - Data members
    // ----------------------------------------------------------------------------------

    var articalURL: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        loadArticals()
    }

    // ----------------------------------------------------------------------------------
    // MARK: - Private Method to load Articals
    // ----------------------------------------------------------------------------------
    
    private func loadArticals() {
        if let articleURL = articalURL {
            guard let myArticalURL = URL(string: articleURL) else {
                print("Invalid URL string.")
                return
            }
            let myRequest = URLRequest(url: myArticalURL)
            webView.load(myRequest)
        } else {
            print("Article URL is nil.")
        }
    }
}

// ----------------------------------------------------------------------------------
// MARK: - Storyboarding
// ----------------------------------------------------------------------------------
extension ArticalWebLinkVC: Storyboarding {
    static var storyboardName: String {
        return "Main"
    }
}
