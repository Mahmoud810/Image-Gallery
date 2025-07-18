//
//  GalleryViewModel.swift
//  Image Gallery
//
//  Created by Mahmoud on 18/07/2025.
//

import Foundation

class GalleryViewModel {
    
    var images: [ResultItem] = [] {
        didSet {
            onImagesUpdated?(images)
        }
    }

    var onImagesUpdated: (([ResultItem]) -> Void)?

    func fetchImages() {
        NetworkManager.shared.fetchImages { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case let .success(fetchedImages):
                    self?.images = fetchedImages
                case let .failure(error):
                    print("Failed to fetch images:", error.localizedDescription)
                }
            }
        }
    }
}
