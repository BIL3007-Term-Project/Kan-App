//
//  ViewControllerKanDetay.swift
//  Kan App
//
//  Created by Hüdahan Altun on 9.12.2022.
//

import UIKit
import MapKit

class ViewControllerKanBagisDetay: UIViewController {

    
    @IBOutlet weak var bagisNoktaImageView: UIImageView!
    
    @IBOutlet weak var bagisNoktaAdLabel: UILabel!
    
    
    @IBOutlet weak var bagisNoktaMapView:MKMapView!
    
    var noktaID:Int?
    
    var bagisNokta:BagisNokta = BagisNokta ()
    override func viewDidLoad() {
        super.viewDidLoad()

        
        bagisNokta = BagisNoktaDAO().bagisNoktaGetir(id: noktaID!)
        
        bagisNoktaImageView.image = UIImage(named: bagisNokta.getBagisImage())
        bagisNoktaAdLabel.text = bagisNokta.getBagisAd()
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
