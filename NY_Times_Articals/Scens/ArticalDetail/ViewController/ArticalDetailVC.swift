//
//  ArticalVC.swift
//  NY_Times_Articals
//
//  Created by Ali Waseem on 29/07/2024.
//


import UIKit

class ArticalDetailVC: UIViewController {

    // ----------------------------------------------------------------------------------
    // MARK: - Outlets
    // ----------------------------------------------------------------------------------
    @IBOutlet weak var lblArticalDescription: UILabel!
    @IBOutlet weak var lblArticalTitle: UILabel!
    @IBOutlet weak var imgViewArtical: UIImageView!

    // ----------------------------------------------------------------------------------
    // MARK: - Data Members
    // ----------------------------------------------------------------------------------
    var articalObj: ArticalResult?
    var router: ArticalDetailRouter?


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        configureUI()
    }

    // ----------------------------------------------------------------------------------
    // MARK: - Configure UI
    // ----------------------------------------------------------------------------------

    private func configureUI() {
        lblArticalTitle.text = articalObj?.title
        lblArticalDescription.text = articalObj?.adxKeywords

        if let media = articalObj?.media, !media.isEmpty,
           let mediaMetadata = media[0].mediaMetadata, !mediaMetadata.isEmpty,
           let urlString = mediaMetadata[0].url,
           let url = URL(string: urlString) {
            imgViewArtical.setImage(from: url, placeholder: UIImage(systemName: "newspaper"))
        } else {
            imgViewArtical.image = UIImage(systemName: "newspaper")
        }
    }

    // ----------------------------------------------------------------------------------
    // MARK: - IB Action
    // ----------------------------------------------------------------------------------

    @IBAction func actionDetailBtn(_ sender: Any) {
        router?.route(to: ArticalDetailRoute.aticalDetailLink.rawValue, parameters: articalObj?.url)
    }
}


// ----------------------------------------------------------------------------------
// MARK: - Storyboarding
// ----------------------------------------------------------------------------------
extension ArticalDetailVC: Storyboarding {
    static var storyboardName: String {
        return "Main"
    }
}
