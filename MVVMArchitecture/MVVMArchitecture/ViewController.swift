//
//  ViewController.swift
//  MVVMArchitecture
//
//  Created by Ömer Can Koç on 14.09.2021.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableViewCoins: UITableView!
    
    // Row sayisini elde et.
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    // Row icerigini elde et.
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CoinCell", for: indexPath) as! TableViewCell
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableViewCoins.delegate = self
        tableViewCoins.dataSource = self
    }
}

