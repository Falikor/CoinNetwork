//
//  CoinData.swift
//  CoinNetwork
//
//  Created by Татьяна Татьяна on 29.06.2021.
//

import Foundation

// MARK: - CoinElement
struct CoinElement: Codable {
    let assetID, name: String?
    let priceUsd: Float?
    let idIcon: String?

    enum CodingKeys: String, CodingKey {
        case assetID = "asset_id"
        case name
        case priceUsd = "price_usd"
        case idIcon = "id_icon"
    }
}

struct Icon: Codable {
    let assetID: String?
    let url: String?
    
    enum CodingKeys: String, CodingKey {
        case assetID = "asset_id"
        case url
    }
}
