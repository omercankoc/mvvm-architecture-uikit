//
//  ViewController.swift
//  MVVMArchitecture
//
//  Created by Ömer Can Koç on 14.09.2021.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableViewCoins: UITableView!
    
    private var coinListViewModel : CoinListViewModel!
    
    // Row sayisini elde et.
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.coinListViewModel == nil ? 0 : self.coinListViewModel.numberOfRowsInSection()
    }
    
    // Row icerigini elde et.
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CoinCell", for: indexPath) as! TableViewCell
        let coinViewModel = self.coinListViewModel.coinIndex(indexPath.row)
        cell.labelCurrency.text = coinViewModel.currency
        cell.labelPrice.text = coinViewModel.price
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableViewCoins.delegate = self
        tableViewCoins.dataSource = self
        
        getData()
        
    }
    
    func getData(){
        let url = URL(string : "https://raw.githubusercontent.com/omercankoc/mvvm-architecture-ios/master/coins.json")!
        
        CoinService().downloadCoins(url: url) {(coinList) in
            if let coinList = coinList {
                self.coinListViewModel = CoinListViewModel(coinCurrencyList: coinList)
            }
            
            DispatchQueue.main.async {
                self.tableViewCoins.reloadData()
            }
        }
    }
}

