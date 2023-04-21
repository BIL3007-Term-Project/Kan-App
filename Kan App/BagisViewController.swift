//
//  BagisViewController.swift
//  Kan App
//
//  Created by Hüdahan Altun on 5.12.2022.
//

import UIKit

class BagisViewController: UIViewController {

    @IBOutlet weak var kanLabel: UILabel!
    
    @IBOutlet weak var aferezLabel: UILabel!
    
    
    @IBOutlet weak var immunLabel: UILabel!
    
    @IBOutlet weak var kokhucreLabel: UILabel!
    
    @IBOutlet weak var aferezImageView: UIImageView!
    
    @IBOutlet weak var kanImageView: UIImageView!
    
    @IBOutlet weak var immunImageView: UIImageView!
    
    @IBOutlet weak var kokİmageView: UIImageView!
    
    
    @IBOutlet weak var aferezButton: UIButton!
    
    @IBOutlet weak var kanButton: UIButton!
    
    @IBOutlet weak var immuneButton: UIButton!
    
    @IBOutlet weak var kokButton: UIButton!
    
    
    @IBOutlet weak var kanBagisBackground: UIImageView!
    
    @IBOutlet weak var aferezBagisBackground: UIImageView!
    
    
    @IBOutlet weak var immunBagisBackground: UIImageView!
    
    @IBOutlet weak var kokBagisBackground: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.hidesBackButton = true
        //hudahanaltun@gmail.com
        bagisİcerikGizle()
        kanBagisBackground.layer.cornerRadius = kanBagisBackground.frame.height/10
        aferezBagisBackground.layer.cornerRadius = aferezBagisBackground.frame.height/10
        immunBagisBackground.layer.cornerRadius = immunBagisBackground.frame.height/10
        kokBagisBackground.layer.cornerRadius = kokBagisBackground.frame.height/10
    }
    
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        
        runAnimation()
        navigationItem.hidesBackButton = true
    }
    override func viewWillDisappear(_ animated: Bool) {
        bagisİcerikGizle()
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
    
    func runAnimation(){
        
        
            UIView.animate(withDuration: 0.5,animations: {
                
                
                self.kanLabel.alpha = 1
                self.kanBagisBackground.alpha = 1
                self.kanImageView.alpha = 1
                self.kanButton.alpha = 1
                
            }, completion: {
                (true) in
                
                UIView.animate(withDuration: 0.5, animations: {
                    self.aferezLabel.alpha = 1
                    self.aferezBagisBackground.alpha = 1
                    self.aferezImageView.alpha = 1
                    self.aferezButton.alpha = 1
                    
                },completion: {
                    (true) in
                    
                    UIView.animate(withDuration: 0.5, animations: {
                        self.immunLabel.alpha = 1
                        self.immunBagisBackground.alpha = 1
                        self.immunImageView.alpha = 1
                        self.immuneButton.alpha = 1
                        
                    },completion: {
                        (true) in
                        
                        UIView.animate(withDuration: 0.5, animations: {
                            self.kokhucreLabel.alpha = 1
                            self.kokBagisBackground.alpha = 1
                            self.kokİmageView.alpha = 1
                            self.kokButton.alpha = 1
                            
                        },completion: nil)
                    })
                })
                
            })
    }
    func bagisİcerikGizle(){
        kanLabel.alpha = 0
        kanBagisBackground.alpha = 0
        kanImageView.alpha = 0
        kanButton.alpha = 0
        
        aferezLabel.alpha = 0
        aferezBagisBackground.alpha = 0
        aferezImageView.alpha = 0
        aferezButton.alpha = 0
        
        immunLabel.alpha = 0
        immunBagisBackground.alpha = 0
        immunImageView.alpha = 0
        immuneButton.alpha = 0
        
        kokhucreLabel.alpha = 0
        kokBagisBackground.alpha = 0
        kokİmageView.alpha = 0
        kokButton.alpha = 0
    }
}
