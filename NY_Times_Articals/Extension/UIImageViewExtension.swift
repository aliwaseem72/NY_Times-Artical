//
//  ArticalVC.swift
//  NY_Times_Articals
//
//  Created by Ali Waseem on 28/07/2024.
//

import UIKit

class ImageCache {
    static let shared = ImageCache()
    private init() {}

    private var cache = NSCache<NSString, UIImage>()

    func image(forKey key: String) -> UIImage? {
        return cache.object(forKey: key as NSString)
    }

    func save(image: UIImage, forKey key: String) {
        cache.setObject(image, forKey: key as NSString)
    }
}

extension UIImageView {
    func setImage(from url: URL, placeholder: UIImage? = nil) {
        self.image = placeholder

        // Check if the image is already cached
        if let cachedImage = ImageCache.shared.image(forKey: url.absoluteString) {
            self.image = cachedImage
            return
        }

        // Download the image
        URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            guard let self = self, let data = data, error == nil, let image = UIImage(data: data) else {
                return
            }

            // Cache the downloaded image
            ImageCache.shared.save(image: image, forKey: url.absoluteString)

            // Set the image on the main thread
            DispatchQueue.main.async {
                self.image = image
            }
        }.resume()
    }

    // MARK: - Make rounded/circular imageview
    func makeRoundedImageView() {
        self.layer.masksToBounds = false
        self.layer.cornerRadius = self.frame.size.width / 2
        self.clipsToBounds = true
    }
}
