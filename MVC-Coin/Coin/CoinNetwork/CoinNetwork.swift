//
//  CoinNetwork.swift
//  MVC-Coin
//
//  Created by Данила Бердников on 07.07.2022.
//

import Foundation

class CoinNetwork {
    private init(){}
    
    static func getCoin(url:String, comletion: @escaping(GetCoin) -> ()) {
        guard let url = URL(string: "https://rest-sandbox.coinapi.io/v1/assets/?apikey=41578F69-77C5-4146-91F1-CC402F426F46")
        else { return
        }
        Network.shared.getData(url: url) { (json) in
            do {
                let response = try GetCoin(json: json)
                comletion(response)
            } catch {
                print(error)
            }
        }
    }
}
