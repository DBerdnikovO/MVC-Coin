//
//  ViewController.swift
//  MVC-Coin
//
//  Created by Данила Бердников on 07.07.2022.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    let url = URL(string: "https://rest-sandbox.coinapi.io/v1/assets/?apikey=41578F69-77C5-4146-91F1-CC402F426F46")
    
    var coins = [Coin]()
    
    static let numberFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.locale = .current
        formatter.allowsFloats = true
        formatter.numberStyle = .currency
        formatter.formatterBehavior = .default
        
        return formatter
    }()
    
    override func viewDidLoad() {
    
        title = "Crypto"
        super.viewDidLoad()
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self
        
        CoinNetwork.getCoin(url: "Dadada") { (response) in
            self.coins = response.coins
            self.tableView.reloadData()
        }

    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    
    private let tableView: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.register(Cell.self, forCellReuseIdentifier: Cell.identifire)
        return table
    }()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return coins.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: Cell.identifire,
            for: indexPath
        ) as? Cell else {
            fatalError()
        }
        cell.configure(with: coins[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
}

