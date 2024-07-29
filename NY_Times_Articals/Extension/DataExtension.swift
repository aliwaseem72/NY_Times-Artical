//
//  DataExtension.swift
//  NY_Times_Articals
//
//  Created by Ali Waseem on 27/07/2024.
//

import Foundation

extension Data {
    // MARK: - Decode JSON to Swift
    func decode<T: Decodable>(into: T.Type) -> T? {
        let decoder = JSONDecoder()
        let model = try? decoder.decode(T.self, from: self)
        return model
    }
}
