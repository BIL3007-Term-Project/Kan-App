//
//  TableViewCellGecmisBagis.swift
//  Kan App
//
//  Created by Hüdahan Altun on 1.02.2023.
//

import UIKit

class TableViewCellGecmisBagis: UITableViewCell {

    @IBOutlet weak var hastaneBilgisi: UILabel!
    
    @IBOutlet weak var detayImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
