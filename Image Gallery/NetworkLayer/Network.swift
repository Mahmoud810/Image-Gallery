//
//  Network.swift
//  Image Gallery
//
//  Created by Mahmoud on 18/07/2025.
//

import Foundation

class NetworkManager {
    static let shared = NetworkManager()
    private init() {}

    func fetchImages(completion: @escaping (Result<[ResultItem], Error>) -> Void) {
        let urlString = "https://api.unsplash.com/search/photos?query=flowers&per_page=10&client_id=u_uf3hyAt4IU5M8Y47bHWE3S4809AjEGyC4OJKDUWtQ"
        guard let url = URL(string: urlString) else { return }

        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                print(String(data: data, encoding: .utf8) ?? "Invalid UTF-8")
            }

            if let error = error {
                completion(.failure(error))
                return
            }

            guard let data = data else { return }

            do {
                let decoded = try JSONDecoder().decode(ImageModel.self, from: data)
                print("decoded done")
                completion(.success(decoded.results))
            } catch {
                print("error appear")
                completion(.failure(error))
            }
        }.resume()
    }
}
