//
//  GalleryVC.swift
//  Image Gallery
//
//  Created by Mahmoud on 18/07/2025.
//

import UIKit

class GalleryVC: UIViewController {
    @IBOutlet var collection: UICollectionView!
    static let identifier = "ImageCell"

    private let viewModel = GalleryViewModel()
    private var images: [ResultItem] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        collection.dataSource = self
        collection.delegate = self

        let nib = UINib(nibName: "GalleryCell", bundle: nil)
        collection.register(nib, forCellWithReuseIdentifier: GalleryCell.identifier)

        viewModel.fetchImages()
        bindViewModel()
    }

    private func bindViewModel() {
        viewModel.onImagesUpdated = { [weak self] images in
            self?.images = images
            DispatchQueue.main.async {
                self?.collection.reloadData()
            }
        }
    }
}

extension GalleryVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GalleryCell.identifier, for: indexPath) as? GalleryCell else {
            return UICollectionViewCell()
        }

        let imageUrl = images[indexPath.row].urls.small
        cell.configure(with: imageUrl)
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
      
        let fullScreenVC = ImageFullScreenVC()
        fullScreenVC.imageUrl = images[indexPath.row].urls.full
        navigationController?.pushViewController(fullScreenVC, animated: true)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.frame.width / 2) - 8
        return CGSize(width: width, height: width)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }
}
