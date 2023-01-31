//
//  ViewController.swift
//  MVVMUIKit
//
//  Created by Ömer Can Koç on 11.01.2023.
//

import UIKit

class CountriesViewController: UIViewController {

    @IBOutlet weak var countriesTableView: UITableView!
    
    private var countriesViewModel : CountriesViewModel!
    
    var countries : [CountryModel] = []
    var country : CountryModel?
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        countriesTableView.delegate = self
        countriesTableView.dataSource = self
        
        navigationItem.title = "Countries"
                
        listingCountries()
        
        let searchController = UISearchController()
        searchController.searchBar.delegate = self
        searchController.searchResultsUpdater = self
        navigationItem.searchController = searchController
    }
    
    func listingCountries(){
        let url = URL(string : "https://raw.githubusercontent.com/omercankoc/mvvm-architecture-uikit/master/countries.json")!
        Requests().getCountriesRequest(url: url) { (countries) in
            
            if let countries = countries {
                self.countriesViewModel = CountriesViewModel(countries: countries)
                self.countries = self.countriesViewModel.countries
            }
            
            DispatchQueue.main.async { self.countriesTableView.reloadData() }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toCountryDetails" {
            let countryViewController = segue.destination as! CountryViewController
            countryViewController.country = country
        }
    }
}

extension CountriesViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.countries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = countriesTableView.dequeueReusableCell(withIdentifier: "CountryCell", for: indexPath) as! CountryTableViewCell
        
        let item = countries[indexPath.row]
        cell.countryLabel.text = item.shortName
        cell.codeLabel.text = item.betaCode
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        country = countries[indexPath.row]
        performSegue(withIdentifier: "toCountryDetails", sender: nil)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle : UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            countries.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.fade)
        }
    }
}

extension CountriesViewController : UISearchResultsUpdating, UISearchBarDelegate {
    func updateSearchResults(for searchController: UISearchController) {
        
        guard let searching = searchController.searchBar.text else { return }
        
        if searching == "" {
            countries = countriesViewModel.countries
        } else {
            countries = countries.filter({$0.shortName!.lowercased().hasPrefix(searching.lowercased())})
        }
        
        countriesTableView.reloadData()
    }
}

