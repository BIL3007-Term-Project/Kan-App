//
//  KayitViewController.swift
//  Kan App
//
//  Created by Hüdahan Altun on 29.11.2022.
//

import UIKit

class KayitViewController: UIViewController {

    @IBOutlet weak var kayitOlButton: UIButton!
    
    @IBOutlet weak var kayitProgressView: UIProgressView!
    
    override func viewDidLoad() {
        super.viewDidLoad()


        kayitProgressView.setProgress(0.6, animated: true)
        
        UIView.animate(withDuration: 2 , delay:1.5, animations: {
            
            self.kayitProgressView.setProgress(1, animated: true)
        })
    }
    

    
    @IBAction func kayitOlButtonPressed(_ sender: Any) {
        
        performSegue(withIdentifier: K.kToMain, sender: nil)
    }
    
}
