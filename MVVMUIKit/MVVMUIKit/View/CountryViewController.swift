//
//  CountryDetailView.swift
//  MVVMUIKit
//
//  Created by Ömer Can Koç on 12.01.2023.
//

import UIKit

class CountryViewController: UIViewController {

    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var nationalityLabel: UILabel!
    @IBOutlet weak var shortCodeLabel: UILabel!
    @IBOutlet weak var longCodeLabel: UILabel!
    
    var country : CountryModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        countryLabel.text = country?.shortName
        nationalityLabel.text = country?.nationality
        shortCodeLabel.text = country?.alphaCode
        longCodeLabel.text = country?.betaCode
    }
}
