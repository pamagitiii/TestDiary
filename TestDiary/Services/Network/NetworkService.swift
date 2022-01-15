//
//  NetworkService.swift
//  TestDiary
//
//  Created by Anatoliy on 13.01.2022.
//

import Foundation

final class NetworkService {
    
    func baseRequest<T: Decodable>(url: URL, completion: @escaping (Result<T, Error>) -> Void) {
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let error = error {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
                return
            }
            
            guard let data = data else {
                DispatchQueue.main.async {
                    completion(.failure(NetworkErrors.dataIsEmpty))
                }
                return
            }
            
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .secondsSince1970
            
            do {
                let decodedObject = try decoder.decode(T.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(decodedObject))
                }
            } catch {
                DispatchQueue.main.async {
                    completion(.failure(NetworkErrors.decodeIsFail))
                }
            }
            
        }.resume()
    }
}

enum NetworkErrors: Error, LocalizedError {
    case dataIsEmpty
    case decodeIsFail
    
    var errorDescription: String? {
        switch self {
        case .dataIsEmpty:
            return "Data is empty"
        case .decodeIsFail:
            return "Error while decoding data"
        }
    }
}
