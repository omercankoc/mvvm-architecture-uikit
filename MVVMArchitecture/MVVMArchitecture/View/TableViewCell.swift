//
//  TableViewCell.swift
//  MVVMArchitecture
//
//  Created by Ömer Can Koç on 14.09.2021.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var labelCurrency: UILabel!
    @IBOutlet weak var labelPrice: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
