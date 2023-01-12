//
//  CountriesViewModel.swift
//  MVVMUIKit
//
//  Created by Ömer Can Koç on 11.01.2023.
//

import Foundation
import Combine

struct CountriesViewModel {
    let countries : [CountryModel]
}

struct CountryViewModel {
    let country : CountryModel
}

extension CountriesViewModel {
    func numberOfRowsInSection() -> Int {
        return self.countries.count
    }
    
    func countryIndex(_ index : Int) -> CountryViewModel {
        let country = self.countries[index]
        return CountryViewModel(country: country)
    }
}

extension CountryViewModel {
    var code : Int? { return self.country.code }
    var alphaCode : String? { return self.country.alphaCode }
    var betaCode : String? { return self.country.betaCode }
    var shortName : String? { return self.country.shortName }
    var nationality: String? { return self.country.nationality }
}
