//
//  CountryTableViewCell.swift
//  MVVMUIKit
//
//  Created by Ömer Can Koç on 11.01.2023.
//

import UIKit

class CountryTableViewCell: UITableViewCell {
    
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var codeLabel: UILabel!
        
    override func awakeFromNib() { super.awakeFromNib() }
    override func setSelected(_ selected: Bool, animated: Bool) { super.setSelected(selected, animated: animated) }
}
