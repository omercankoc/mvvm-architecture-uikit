//
//  ViewController.swift
//  MVVMUIKit
//
//  Created by Ömer Can Koç on 11.01.2023.
//

import UIKit

class CountriesTableView: UIViewController {

    @IBOutlet weak var countriesTableView: UITableView!
    
    private var countriesViewModel : CountriesViewModel!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        countriesTableView.delegate = self
        countriesTableView.dataSource = self
        
        navigationItem.title = "Countries"
        
        listingCountries()
    }
    
    func listingCountries(){
        let url = URL(string : "https://raw.githubusercontent.com/omercankoc/mvvm-architecture-uikit/master/countries.json")!
        Requests().getCountriesRequest(url: url) { (countries) in
            if let countries = countries {
                self.countriesViewModel = CountriesViewModel(countries: countries)
            }
            
            DispatchQueue.main.async { self.countriesTableView.reloadData() }
        }
    }
}

extension CountriesTableView : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.countriesViewModel == nil ? 0 : self.countriesViewModel.numberOfRowsInSection()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = countriesTableView.dequeueReusableCell(withIdentifier: "CountryCell", for: indexPath) as! CountryTableViewCell
        
        let item = countriesViewModel.countryIndex(indexPath.row)
        cell.countryLabel.text = item.shortName
        cell.codeLabel.text = item.betaCode
        
        return cell
    }
}

