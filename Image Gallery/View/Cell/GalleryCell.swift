//
//  GalleryCell.swift
//  Image Gallery
//
//  Created by Mahmoud on 18/07/2025.
//

import UIKit

class GalleryCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    
    static let identifier = "ImageCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
    }
    
    func configure(with imageUrl: String) {
        imageView.image = UIImage(systemName: "photo") // Placeholder
        
        ImageLoader.shared.loadImage(from: imageUrl) { [weak self] image in
            guard let self = self else { return }
            if let image = image {
                self.imageView.image = image
            }
        }
    }
}
