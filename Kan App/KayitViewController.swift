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
    
//    MARK: - iOS Cycle fonskiyonları
    override func viewDidLoad() {
        super.viewDidLoad()

        kayitOlButton.alpha = 0

        emailTextField.autocorrectionType = .no
        emailTextField.autocapitalizationType = .none
        sifreTextField.autocorrectionType = .no
        sifreTextField.autocapitalizationType = .none
        sifreTekTextField.autocorrectionType = .no
        sifreTekTextField.autocapitalizationType = .none
        
        KKSwitch.isOn = false
        gizlilikSwitch.isOn = false
        
//        kayitOlButton.isEnabled = false
        
        kayitProgressView.setProgress(0.6, animated: true)
        
      
        UIView.animate(withDuration: 2,delay: 2 ,animations: {
            
            self.kayitProgressView.setProgress(1, animated: true)
            
        })
        
    
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(hesapGuvAlert), userInfo: nil, repeats: false)
        
    }
    

//MARK: - IBAction fonksiyonları
    

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
        
        
        kayitVerileriniAl(emailTF: emailTextField, sifreTF: sifreTextField, sifreTkrTF: sifreTekTextField)
//        performSegue(withIdentifier: K.kToMain, sender: nil)
        
    }
    
    
    @IBAction func questionMarkPressed(_ sender: UIBarButtonItem) {
        
        let alertController = UIAlertController(title: "Hesap Güvenliği", message: K.hesapGuv, preferredStyle: .alert)
        
        let tamamButton = UIAlertAction(title: "Tamam", style: .cancel)
        
        alertController.addAction(tamamButton)
        
        self.present(alertController, animated: true)
        
    }
    
}

//MARK: - Güvenlik Kontrol fonksiyonları
extension KayitViewController{
    
    func kayitVerileriniAl(emailTF:UITextField,sifreTF:UITextField,sifreTkrTF:UITextField){
        
        if let mail = emailTF.text, let sifre = sifreTF.text, let sifreTkr = sifreTkrTF.text{
            
            //firebase

            let check1 = alınanMailGuv(mail: mail)
            let check2 = alınanSifreGuv(sifre: sifre)
            
            if check1 == true && check2 == true && sifre==sifreTkr{
                
                
                print("hesap oluşturuldu yeğen")
            }else{
                
                bilgilerYanlisAlert()
            }
            
        }else{
            
            bosAlanHatası()
            
        }
        
        
        
    }
    
    func alınanMailGuv(mail:String)->Bool{
        
        
        let range = mail.index(mail.endIndex,offsetBy:-10) ..< mail.endIndex
        let arraySlicer = mail[range]
        let newArray = Array(arraySlicer)
        
        if newArray == K.gmailCheck{
            
            print("hesap gmail")
            return true
        }else{
            print("hesap gmail değil")
            return false
        }
        
    }
    
    func alınanSifreGuv(sifre:String)->Bool{
        
        //regular expression temelli sifre kontrolü( özel karakter,8 karakter,bir büyük harf ve bir sayı)
        let password = NSPredicate(format: "SELF MATCHES %@ ", "^(?=.*[a-z])(?=.*[.,$@$#!%*?&])(?=.*[0-9])(?=.*[A-Z]).{8,}$")
        
        return password.evaluate(with: sifre)
        
    }
}


//MARK: - OBJ-c trigger ve alert fonksiyonları fonksiyonları
extension KayitViewController{
    
    
    @objc func hesapGuvAlert(){
        
        let alertController = UIAlertController(title: "Hesap Güvenliği", message: K.hesapGuv, preferredStyle: .alert)
        
        let tamamButton = UIAlertAction(title: "Tamam", style: .cancel)
        
        alertController.addAction(tamamButton)
        
        self.present(alertController, animated: true)
        
    }
    
    func bilgilerYanlisAlert(){
        
        let alertController = UIAlertController(title: "Hesap Güvenliği", message: K.guvHata, preferredStyle: .alert)
        
        let tamamButton = UIAlertAction(title: "Tamam", style: .cancel)
        
        alertController.addAction(tamamButton)
        
        self.present(alertController, animated: true)
        
    }
    
    func bosAlanHatası(){
        
        let alertController = UIAlertController(title: "Hesap Güvenliği", message: K.bosAlanHata, preferredStyle: .alert)
        
        let tamamButton = UIAlertAction(title: "Tamam", style: .cancel)
        
        alertController.addAction(tamamButton)
        
        self.present(alertController, animated: true)
        
    }
    
}

//MARK: - TextField Protocol Fonksiyonları
extension KayitViewController:UITextFieldDelegate{
    
    
    
}
