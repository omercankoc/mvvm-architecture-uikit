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
    
    private var colorArray = [UIColor]()
    
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
        cell.backgroundColor = self.colorArray[indexPath.row % 5]
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableViewCoins.delegate = self
        tableViewCoins.dataSource = self
        
        self.colorArray = [
            UIColor(displayP3Red: 50/255, green: 50/255, blue: 50/255, alpha: 1.0),
            UIColor(displayP3Red: 100/255, green: 100/255, blue: 100/255, alpha: 1.0),
            UIColor(displayP3Red: 150/255, green: 150/255, blue: 150/255, alpha: 1.0),
            UIColor(displayP3Red: 200/255, green: 200/255, blue: 200/255, alpha: 1.0),
            UIColor(displayP3Red: 250/255, green: 250/255, blue: 250/255, alpha: 1.0)
        ]
        
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

