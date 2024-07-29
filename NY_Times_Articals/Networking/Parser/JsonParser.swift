//
//  JsonParser.swift
//  NY_Times_Articals
//
//  Created by Ali Waseem on 27/07/2024.
//

import Foundation

/**
 A class that handles parsing JSON data into a specified Decodable type.
 */
class JsonParser: Parser {

    /**
     Parses the given JSON data into the specified Decodable type.

     - Parameters:
     - data: The JSON data to be parsed.
     - type: The Decodable type to parse the data into. Defaults to T.self.

     - Returns: A Result object containing either the parsed model of type T or an AppError if parsing fails.
     */
    func parseWith<T: Decodable>(data: Data, type: T.Type = T.self) -> Result<T, AppError> {
        let decoder = JSONDecoder()
        do {
            let model = try decoder.decode(type, from: data)
            return .success(model)
        } catch {
            debugPrint(error)
            return .failure(AppError.unexpectedResponse)
        }
    }
}
