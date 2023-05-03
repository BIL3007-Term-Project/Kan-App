//
//  TableViewCellAcil.swift
//  Kan App
//
//  Created by Hüdahan Altun on 20.12.2022.
//

import UIKit

class TableViewCellAcil: UITableViewCell {

    @IBOutlet weak var acilLabel: UILabel!
    
    @IBOutlet weak var mesafeLabel: UILabel!
    
    @IBOutlet weak var tarihLabel: UILabel!
    
    
    @IBOutlet weak var onemDereceImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
