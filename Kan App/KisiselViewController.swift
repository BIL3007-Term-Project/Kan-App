//
//  KisiselViewController.swift
//  Kan App
//
//  Created by Hüdahan Altun on 29.11.2022.
//

import UIKit

class KisiselViewController: UIViewController {

    
    @IBOutlet weak var ileriKButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func ileriKButtonPressed(_ sender: UIButton) {
        
        self.performSegue(withIdentifier: K.kToKayit, sender: nil)
    }
    

}
