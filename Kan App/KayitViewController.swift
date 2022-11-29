//
//  KayitViewController.swift
//  Kan App
//
//  Created by Hüdahan Altun on 29.11.2022.
//

import UIKit

class KayitViewController: UIViewController {

    @IBOutlet weak var kayitOlButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    
    @IBAction func kayitOlButtonPressed(_ sender: Any) {
        
        performSegue(withIdentifier: K.kToMain, sender: nil)
    }
    
}
