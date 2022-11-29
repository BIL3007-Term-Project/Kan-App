//
//  YasalViewController.swift
//  Kan App
//
//  Created by Hüdahan Altun on 29.11.2022.
//

import UIKit

class YasalViewController: UIViewController {

   
    @IBOutlet weak var okudumAnladimButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    @IBAction func okudumAnladimButtonPressed(_ sender: UIButton) {
        
        self.performSegue(withIdentifier: K.yToKisi, sender: nil)
    }
    

}
