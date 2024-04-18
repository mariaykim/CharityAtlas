//
//  CAService.swift
//  CharityAtlas
//
//  Created by Maria Kim on 11/28/23.
//

import Foundation

final class CAService {
    /// Shared singleton instance
    static let shared = CAService()

    /// Privatized constructor
    private init() {}

    enum CAServiceError: Error {
        case failedToCreateRequest
        case failedToGetData
    }

    /// - Parameters:
    ///   - request: Request instance
    ///   - type: The type of object we expect to get back
    ///   - completion: Callback with data or error
    public func execute<T: Codable>(
        _ request: CARequest,
        expecting type: T.Type,
        completion: @escaping (Result<T, Error>) -> Void
    ) {
        guard let urlRequest = self.request(from: request) else {
            completion(.failure(CAServiceError.failedToCreateRequest))
            return
        }

        let task = URLSession.shared.dataTask(with: urlRequest) { data, _, error in
            guard let data = data, error == nil else {
                completion(.failure(error ?? CAServiceError.failedToGetData))
                return
            }

            // Decode response
            do {
                let result = try JSONDecoder().decode(type.self, from: data)
                completion(.success(result))
            }
            catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }

    // MARK: - Private

    private func request(from caRequest: CARequest) -> URLRequest? {
        guard let url = caRequest.url else {
            return nil
        }
        var request = URLRequest(url: url)
        request.httpMethod = caRequest.httpMethod
        return request
    }
}
