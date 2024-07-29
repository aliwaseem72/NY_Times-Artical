//
//  NetworkCall.swift
//  NY_Times_Articals
//
//  Created by Ali Waseem on 27/07/2024.
//

import Foundation

/**
 Protocol defining the structure for making network calls.
 */
protocol NetworkCallProtocol {
    
    /**
     Method to make a network request.
     
     - Parameters:
     - resource: The resource object conforming to RequestProtocol.
     - completion: Closure to be called upon completion of the network request, returning a Result object containing either Data or an AppError.
     */
    func request<R: RequestProtocol>(_ resource: R, completion: @escaping (Result<Data, AppError>) -> Void)
}

/**
 Class implementing the NetworkCallProtocol for making network requests.
 */
class NetworkCall: NetworkCallProtocol {
    
    /**
     Method to make a network request.
     
     - Parameters:
     - resource: The resource object conforming to RequestProtocol.
     - completion: Closure to be called upon completion of the network request, returning a Result object containing either Data or an AppError.
     */
    func request<R>(_ resource: R, completion: @escaping (Result<Data, AppError>) -> Void) where R: RequestProtocol {
        
        // Check network reachability before making the request
        guard Reachability.isConnectedToNetwork() else {
            completion(.failure(AppError.noNetwork))
            return
        }

        var request = URLRequest(url: resource.url)
        request.httpMethod = resource.method.urlMethod
        
        var headers = resource.headers ?? HttpHeaders()
        
        switch resource.encoding {
        case .url:
            if let parameters = resource.parameters {
                var urlComponents = URLComponents(url: resource.url, resolvingAgainstBaseURL: false)
                urlComponents?.queryItems = parameters.map { URLQueryItem(name: $0.key, value: "\($0.value)") }
                request.url = urlComponents?.url
            }
        case .json:
            if let parameters = resource.parameters {
                request.httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: [])
                if headers[CONTENT_TYPE] == nil {
                    headers[CONTENT_TYPE] = APP_JSON
                }
            }
        }
        
        for (key, value) in headers {
            request.setValue(value, forHTTPHeaderField: key)
        }
        
        // Request time out is 60 sec
        request.timeoutInterval = 60
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(AppError.serverError(error)))
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse, let data = data else {
                completion(.failure(AppError.unexpectedResponse))
                return
            }
            
            if httpResponse.statusCode == 200 {
                completion(.success(data))
            } else {
                if let errorModel = data.decode(into: ApiErrorResponseModel.self) {
                    completion(.failure(AppError.apiError(errorModel)))
                } else {
                    completion(.failure(AppError.unexpectedResponse))
                }
            }
        }
        
        task.resume()
    }
}
