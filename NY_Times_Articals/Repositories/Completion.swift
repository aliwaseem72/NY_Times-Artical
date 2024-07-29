//
//  Typealis.swift
//  NY_Times_Articals
//
//  Created by Ali Waseem on 27/07/2024.
//

import Foundation

// typealias CompletionWithSuccess is a closure that takes a generic type T conforming to Decodable protocol as parameter and returns void
typealias CompletionWithSuccess<T: Decodable> = (T) -> Void

// typealias CompletionWithServiceError is a closure that takes an AppError as parameter and returns void
typealias CompletionWithServiceError = (AppError) -> Void
