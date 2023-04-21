//
//  TableViewCellBagis.swift
//  Kan App
//
//  Created by Hüdahan Altun on 18.12.2022.
//

import UIKit

class TableViewCellBagis: UITableViewCell {

    
    @IBOutlet weak var bagisYerImageView: UIImageView!
    
    @IBOutlet weak var bagisYerLabel: UILabel!
    
    
    @IBOutlet weak var bagisCalismaSaatleriLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
