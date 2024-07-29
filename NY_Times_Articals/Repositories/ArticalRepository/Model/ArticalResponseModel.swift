//
//  ArticalResponseModel.swift
//  NY_Times_Articals
//
//  Created by Ali Waseem on 27/07/2024.
//

import Foundation

struct ArticalResponseModel: Codable {
    let status, copyright: String?
    let numResults: Int?
    let results: [ArticalResult]?

    enum CodingKeys: String, CodingKey {
        case status, copyright
        case numResults = "num_results"
        case results
    }
}

// MARK: - ArticalResult
struct ArticalResult: Codable {
    let uri: String?
    let url: String?
    let id, assetID: Int?
    let source: String?
    let publishedDate, updated, section, subsection: String?
    let nytdsection, adxKeywords: String?
    let column: String?
    let byline: String?
    let type: String?
    let title, abstract: String?
    let desFacet, orgFacet, perFacet, geoFacet: [String]?
    let media: [Media]?
    let etaID: Int?

    enum CodingKeys: String, CodingKey {
        case uri, url, id
        case assetID = "asset_id"
        case source
        case publishedDate = "published_date"
        case updated, section, subsection, nytdsection
        case adxKeywords = "adx_keywords"
        case column, byline, type, title, abstract
        case desFacet = "des_facet"
        case orgFacet = "org_facet"
        case perFacet = "per_facet"
        case geoFacet = "geo_facet"
        case media
        case etaID = "eta_id"
    }
}

// MARK: - Media
struct Media: Codable {
    let type: String?
    let subtype: String?
    let caption, copyright: String?
    let approvedForSyndication: Int?
    let mediaMetadata: [MediaMetadata]?

    enum CodingKeys: String, CodingKey {
        case type, subtype, caption, copyright
        case approvedForSyndication = "approved_for_syndication"
        case mediaMetadata = "media-metadata"
    }
}

// MARK: - MediaMetadata
struct MediaMetadata: Codable {
    let url: String?
    let format: String?
    let height, width: Int?
}
