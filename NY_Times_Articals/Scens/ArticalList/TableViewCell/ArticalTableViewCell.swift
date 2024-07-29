//
//  ArticalVC.swift
//  NY_Times_Articals
//
//  Created by Ali Waseem on 28/07/2024.
//


import UIKit

class ArticalTableViewCell: UITableViewCell {

    @IBOutlet weak var lblArticalPublishedDate: UILabel!
    @IBOutlet weak var lblArticalBy: UILabel!
    @IBOutlet weak var lblArticalTitle: UILabel!
    @IBOutlet weak var imgViewArtical: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        imgViewArtical.makeRoundedImageView()
    }

    // Configure Artical by response model ArticalResult
    func configureCell(response: ArticalResult) {
        lblArticalTitle.text = response.title
        lblArticalBy.text = response.byline
        lblArticalPublishedDate.text = response.publishedDate

        if let media = response.media, !media.isEmpty,
           let mediaMetadata = media[0].mediaMetadata, !mediaMetadata.isEmpty,
           let urlString = mediaMetadata[0].url,
           let url = URL(string: urlString) {
            imgViewArtical.setImage(from: url, placeholder: UIImage(systemName: "newspaper"))
        } else {
            imgViewArtical.image = UIImage(systemName: "newspaper")
        }
    }
}
