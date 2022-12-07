//
//  KullanimKosViewController.swift
//  Kan App
//
//  Created by Hüdahan Altun on 1.12.2022.
//

import UIKit

class KullanimKosViewController: UIViewController {

    @IBOutlet weak var kullanimKosLabel: UILabel!
    
    
    @IBOutlet weak var kullanimKosTextview: UITextView!
    
    @IBOutlet weak var KKButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        KKButton.layer.cornerRadius = KKButton.frame.height/2.6
        // Do any additional setup after loading the view.
    }
    @IBAction func KKButtonPressed(_ sender: Any) {
        
        self.dismiss(animated: true,completion: nil)
    }
    
}
