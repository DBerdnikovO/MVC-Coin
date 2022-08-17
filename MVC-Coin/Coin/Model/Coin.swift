//
//  Coin.swift
//  MVC-Coin
//
//  Created by Данила Бердников on 07.07.2022.
//

import Foundation

struct Coin: Codable {
    let name: String
    let price_usd: Double?

    
    init?(dict: [String:AnyObject]) {
        guard let asset_id = dict["asset_id"] as? String,
             let price_usd = dict["price_usd"] as? Double?
        else { return nil }
        self.name = asset_id
        self.price_usd = price_usd
        
    }
}
