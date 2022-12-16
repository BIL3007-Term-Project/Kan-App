//
//  MainViewController.swift
//  Kan App
//
//  Created by Hüdahan Altun on 29.11.2022.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var yasIconIV: UIImageView!
    @IBOutlet weak var boyIconIv: UIImageView!
    @IBOutlet weak var kiloIconIV: UIImageView!
    @IBOutlet weak var kanIconIV: UIImageView!
    
    @IBOutlet weak var menuIconIV: UIImageView!
    @IBOutlet weak var menuButton: UIButton!
    @IBOutlet weak var ayarlarButton: UIButton!
    @IBOutlet weak var cikisButton: UIButton!
    
    
    var fabDurum:Bool = false
    
    var hesapSahibi:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tabBarController?.navigationItem.hidesBackButton = true
        
        yasIconIV.layer.cornerRadius = yasIconIV.frame.height/5
        boyIconIv.layer.cornerRadius = boyIconIv.frame.height/5
        kiloIconIV.layer.cornerRadius = kiloIconIV.frame.height/5
        kanIconIV.layer.cornerRadius = kanIconIV.frame.height/5
        
        ayarlarButton.layer.cornerRadius = ayarlarButton.frame.height/5
        cikisButton.layer.cornerRadius = cikisButton.frame.height/5
        
        ayarlarButton.alpha = 0
        cikisButton.alpha = 0
        
        self.ayarlarButton.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
        self.ayarlarButton.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
    }
    

    override func viewWillAppear(_ animated: Bool) {
        self.ayarlarButton.alpha = 0
        self.cikisButton.alpha = 0
        
        self.menuIconIV.transform = CGAffineTransform(rotationAngle: 0 * .pi/180)//menu'yü eski haline getir
        
        //butonları küçült
        self.ayarlarButton.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
        self.cikisButton.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
        
        self.fabDurum = false
        
    }
    override func viewWillDisappear(_ animated: Bool) {
       
        self.ayarlarButton.alpha = 0
        self.cikisButton.alpha = 0
        
        self.menuIconIV.transform = CGAffineTransform(rotationAngle: 0 * .pi/180)//menu'yü eski haline getir
        
        //butonları küçült
        self.ayarlarButton.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
        self.cikisButton.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
        
        self.fabDurum = false
    }
    @IBAction func menuButtonPressed(_ sender: Any) {
        
        UIView.animate(withDuration: 0.5, animations: {
            
            if self.fabDurum{ // ayarlar ve cıkıs görünüyorsa
            
                self.ayarlarButton.alpha = 0
                self.cikisButton.alpha = 0
                
                self.menuIconIV.transform = CGAffineTransform(rotationAngle: 0 * .pi/180)//menu'yü eski haline getir
                
                //butonları küçült
                self.ayarlarButton.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
                self.cikisButton.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
                
                self.fabDurum = false
                
            }else{
                
                self.ayarlarButton.alpha = 1
                self.cikisButton.alpha = 1
                
                
                self.menuIconIV.transform = CGAffineTransform(rotationAngle: 90 * .pi/180)
                
                
                self.ayarlarButton.transform = CGAffineTransform(scaleX: 1, y: 1)
                self.cikisButton.transform = CGAffineTransform(scaleX: 1, y: 1)

                
                self.fabDurum = true
            }
            
            
        },completion: nil)
    
    }
    
    @IBAction func ayarlarButtonPressed(_ sender: Any) {
        
        print("ayarlar basıldı")
        
        self.performSegue(withIdentifier:K.mToAyar, sender: nil)
    }
    
    @IBAction func cikisButtonPressed(_ sender: Any) {
        print("cikis basıldı")
        
        self.navigationController?.popToRootViewController(animated: true)
    }
    

}
