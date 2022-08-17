//
//  Network.swift
//  MVC-Coin
//
//  Created by Данила Бердников on 07.07.2022.
//

import Foundation

class Network {
    //ВСЕ НОРМ
    private init(){}
    static let shared = Network()

    public func getData(url: URL,comletion: @escaping (Any) -> ()) {
        let session = URLSession.shared
        
        session.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else { return }
            
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: [])

                DispatchQueue.main.async(execute: {comletion(json)})
            } catch {
                print(error)
            }
        }.resume()
    }
}
