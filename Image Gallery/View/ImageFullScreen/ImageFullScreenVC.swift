//
//  ImageFullScreenVC.swift
//  Image Gallery
//
//  Created by Mahmoud on 18/07/2025.
//

import UIKit

class ImageFullScreenVC: UIViewController {
    @IBOutlet var fullSizeImage: UIImageView!
    var imageUrl: String?

    override func viewDidLoad() {
        super.viewDidLoad()

        fullSizeImage.contentMode = .scaleAspectFit

        if let imageUrl = imageUrl {
            ImageLoader.shared.loadImage(from: imageUrl) { [weak self] image in
                self?.fullSizeImage.image = image
            }
        } else {
            fullSizeImage.image = UIImage(systemName: "photo")
        }
    }
}
