//
//  GetCoin.swift
//  MVC-Coin
//
//  Created by Данила Бердников on 07.07.2022.
//

import Foundation

struct GetCoin {
    typealias JSON = [String:AnyObject]
    
    let coins: [Coin]
    
    init(json: Any) throws {
        guard let array = json as? [JSON] else { throw NetworkError.failInternet}
        var coins = [Coin]()
        for dictionary in array {
            guard let coin = Coin(dict: dictionary) else { continue }
            coins.append(coin)
        }
        self.coins = coins
    }
}
