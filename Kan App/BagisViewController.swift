//
//  BagisViewController.swift
//  Kan App
//
//  Created by Hüdahan Altun on 5.12.2022.
//

import UIKit

class BagisViewController: UIViewController {

    @IBOutlet weak var aferezImageView: UIImageView!
    
    @IBOutlet weak var kanImageView: UIImageView!
    
    @IBOutlet weak var immunImageView: UIImageView!
    
    @IBOutlet weak var kokİmageView: UIImageView!
    
    
    @IBOutlet weak var aferezButton: UIButton!
    
    @IBOutlet weak var kanButton: UIButton!
    
    @IBOutlet weak var immuneButton: UIButton!
    
    @IBOutlet weak var kokButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.hidesBackButton = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        navigationItem.hidesBackButton = true
    }
   
    @IBAction func aferezButtonPressed(_ sender: Any) {
        
        performSegue(withIdentifier: K.bToAferez, sender: nil)
    }
    
    @IBAction func kanButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: K.bToKan, sender: nil)
    }
    
    
    @IBAction func immuneButtonPressed(_ sender: Any) {
        
        performSegue(withIdentifier: K.bToImmun, sender: nil)
    }
    
    @IBAction func kokButtonPressed(_ sender: Any) {
        
        performSegue(withIdentifier: K.bToKok, sender: nil)
    }
}
