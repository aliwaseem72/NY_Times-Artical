//
//  Parser.swift
//  NY_Times_Articals
//
//  Created by Ali Waseem on 27/07/2024.
//

import Foundation

/**
 A protocol for parsing data into a specific type.
 */
protocol Parser {

    /**
     Parses the given data into the specified type.

     - Parameters:
     - data: The data to be parsed.
     - type: The type to parse the data into.

     - Returns: A Result object containing either the parsed object of type T or an AppError if parsing fails.
     */
    func parseWith<T: Decodable>(data: Data, type: T.Type) -> Result<T, AppError>
}
