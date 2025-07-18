//
//  ImageEntity.swift
//  Image Gallery
//
//  Created by Mahmoud on 18/07/2025.
//

import Foundation
struct ImageModel: Codable {
    let results: [ResultItem]
}

struct ResultItem: Codable {
    let id: String
    let urls: Urls
}

struct Urls: Codable {
    let full: String
    let regular: String
    let small: String
}
