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
    
    
    @IBOutlet weak var mailTFImageView: UIImageView!
    
    @IBOutlet weak var sifreTFImageView: UIImageView!
    
    @IBOutlet weak var sifreTekTFImageView: UIImageView!
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var sifreTextField: UITextField!
    
    @IBOutlet weak var sifreTekTextField: UITextField!
    
    @IBOutlet weak var KKSwitch: UISwitch!
    
    @IBOutlet weak var gizlilikSwitch: UISwitch!
    
    @IBOutlet weak var questionMarkButton: UIBarButtonItem!
    var güvenlikBildirimi:String = "Mail uzantısı @gmail veya @outlook olmalıdır.\n Sifre büyük,kücük harf ve sayı içermelidir"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        kayitOlButton.alpha = 0

        
        KKSwitch.isOn = false
        gizlilikSwitch.isOn = false
        
//        kayitOlButton.isEnabled = false
        
        kayitProgressView.setProgress(0.6, animated: true)
        
      
        UIView.animate(withDuration: 2,delay: 2 ,animations: {
            
            self.kayitProgressView.setProgress(1, animated: true)
            
        })
        
    
        
    }
    
    func kayitVerileriniAl(emailTF:UITextField,sifreTF:UITextField,sifreTkrTF:UITextField){
        
        if let mail = emailTF.text, let sifre = sifreTF.text, let sifreTkr = sifreTkrTF.text{
            
            
            
        }
        
        
        
    }
    

    @IBAction func KKSwitchToggled(_ sender: UISwitch) {
        
        if sender.isOn{
            if gizlilikSwitch.isOn{
                UIView.animate(withDuration: 1, animations: {
                    self.kayitOlButton.alpha = 1
                })
            }else{
                UIView.animate(withDuration: 1, animations: {
                    self.kayitOlButton.alpha = 0
                })
            }
        }else{
            UIView.animate(withDuration: 1, animations: {
                self.kayitOlButton.alpha = 0
            })
        }
       
    }
    
    @IBAction func gizlilikSwitchToggled(_ sender: UISwitch) {
        
        if sender.isOn{
            if KKSwitch.isOn{
                UIView.animate(withDuration: 1, animations: {
                    self.kayitOlButton.alpha = 1
                })
            }else{
                UIView.animate(withDuration: 1, animations: {
                    self.kayitOlButton.alpha = 0
                })
            }
        }else{
            UIView.animate(withDuration: 1, animations: {
                self.kayitOlButton.alpha = 0
            })
        }
        
    }
                         
    
    @IBAction func kayitOlButtonPressed(_ sender: Any) {
        
        if KKSwitch.isOn && gizlilikSwitch.isOn{
            
            self.kayitOlButton.isEnabled = true
        }
        
        performSegue(withIdentifier: K.kToMain, sender: nil)
        
    }
    
    
    @IBAction func questionMarkPressed(_ sender: UIBarButtonItem) {
        
        let alertController = UIAlertController(title: "Mail ve Şifre", message: güvenlikBildirimi, preferredStyle: .alert)
        
        let tamamButton = UIAlertAction(title: "Tamam", style: .cancel)
        
        alertController.addAction(tamamButton)
        
        self.present(alertController, animated: true)
        
    }
    
    
}


