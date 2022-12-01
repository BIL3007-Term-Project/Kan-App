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
    
    var mailGlobalCheck:Bool = false
    var sifreGlobalCheck:Bool = false
    var sifreTekGlobalCheck:Bool = false
    var kayitCheck:Bool = false
    
    
//    MARK: - iOS Cycle fonskiyonları
    override func viewDidLoad() {
        super.viewDidLoad()


        kayitOlButton.alpha = 0 // başlangıçta buton gözükmüyor

        //textfield klavye düzenlemeleri
        emailTextField.autocorrectionType = .no
        emailTextField.autocapitalizationType = .none
        emailTextField.keyboardType = .default
        emailTextField.returnKeyType = .done
        sifreTextField.autocorrectionType = .no
        sifreTextField.autocapitalizationType = .none
        sifreTextField.keyboardType = .default
        sifreTextField.returnKeyType = .done
        sifreTekTextField.autocorrectionType = .no
        sifreTekTextField.autocapitalizationType = .none
        sifreTekTextField.keyboardType = .default
        sifreTekTextField.returnKeyType = .done
        
//        sifreTextField.isSecureTextEntry = true
//        sifreTekTextField.isSecureTextEntry = true
        //protocol bağlantısı
        emailTextField.delegate = self
        sifreTextField.delegate = self
        sifreTekTextField.delegate = self
        
        //stwitch'ler başlangıçta kapalı durumdadır.
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
        
        //switch'e tıklayınca iki switch in true olmasına göre kayıt ol butonu görünür olacak.
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
        
        //switch'e tıklayınca iki switch in true olmasına göre kayıt ol butonu görünür olacak.
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
    
        kayitVerileriniAl(emailTF: emailTextField, sifreTF: sifreTextField, sifreTkrTF: sifreTekTextField)
//        performSegue(withIdentifier: K.kToMain, sender: nil)
        
    }
    
    
    @IBAction func questionMarkPressed(_ sender: UIBarButtonItem) {//ekranın sag üst kösesindeki soru isareti fonksiyonu
        
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
            
//            let check1 = alınanMailGuv(mail: mail)
//            let check2 = alınanSifreGuv(sifre: sifre)
            
            
            if mailGlobalCheck == true && sifreGlobalCheck == true && sifreTekGlobalCheck == true{
                // Tf içerikleri artık dolu olduğu kesindir.1.asama güvenlik
                
                let check1 = alınanMailGuv(mail: mail)
                let check2 = alınanSifreGuv(sifre: sifre)
                if check1 == true && check2 == true && sifre == sifreTkr{
                    //2.asama güvenlik
                    //mail ve sifre istenen özelliklere sahip ayrıca sifre ile sifre tekrarı bir eşit.
                    performSegue(withIdentifier: K.kToMain, sender: nil)
//                    kayitOlButton.isEnabled = true // buton aktif artık kayıt ol butonuna basılabilir
                    
                    print("hesap oluşturulabilir knk")
                    
                    
                }else{
                    
                    bilgilerYanlisAlert()
                    
                }
            }else{
                
                bosAlanHatası()
            }
            
            
        }else{
            
            bosAlanHatası()
//
            
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
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        
        if textField == emailTextField{
            
            textField.placeholder = "Email"
        }
        else if textField == sifreTextField{
            
            textField.placeholder = "Sifre"
        }
        else if textField == sifreTekTextField{
            
            textField.placeholder = "Sifreyi Tekrarla"
        }
        
        return true
    }//TFShouldBeginEditing sonu
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        
        if textField == emailTextField{
            
            if textField.text == ""{
                
                emailTextField.placeholder = "Email"
            }

        }
        else if textField == sifreTextField{
            
            if textField.text == ""{
                
                sifreTextField.placeholder = "Sifre"
            }
        }
        else if textField == sifreTekTextField{
            
            if textField.text == ""{
                
                sifreTekTextField.placeholder = "Sifreyi Tekrarlab"
            }
        }
        
        return true
        
    }//TFShouldEndEditing sonu
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        
        if textField == emailTextField{
            
            if let mailSayi = textField.text?.count{
                
                if mailSayi > 11 && mailSayi < 30{
                    mailGlobalCheck = true
                    print("mail1.asama :\(mailGlobalCheck)")
                    print("mail 11 haneden büyük 30 dan küçük istenen aralıkta")
                    
                }
                else if mailSayi == 0{
                    mailGlobalCheck = false
                    print("mail1.asama :\(mailGlobalCheck)")
                    emailTextField.text = ""
                    emailTextField.placeholder = "Email"
                    
                    print("mail boş bırakıldı")
                }
                else{
                    mailGlobalCheck = false
                    print("mail1.asama :\(mailGlobalCheck)")
                    emailTextField.text = ""
                    emailTextField.placeholder = "Email"
                    
                    print("mail istenen aralıkta değil")
                }
                
            }
        }//emailTF check sonu
        else if textField == sifreTextField{
            
            if let sifreSayi = textField.text?.count{
                
                if sifreSayi > 0 && sifreSayi < 15{
                    
                    sifreGlobalCheck = true
                    print("sifre1.asama :\(sifreGlobalCheck)")
                    print("sifre 0-15 aralıgında")
                }
                else if sifreSayi == 0{
                    sifreGlobalCheck = false
                    print("sifre1.asama :\(sifreGlobalCheck)")
                    sifreTextField.text = ""
                    sifreTextField.placeholder = "Sifre"
                    print("sifre bos")
                }
                else{
                    
                    sifreGlobalCheck = false
                    print("sifre1.asama :\(sifreGlobalCheck)")
                    sifreTextField.text = ""
                    sifreTextField.placeholder = "Sifre"
                    print("sifre istenen aralıkta değil")
                }
            }
            
        }//sifreTF check sonu
        else if textField == sifreTekTextField{
            
            if let sifreTekSayi = textField.text?.count{
                
                if sifreTekSayi > 0 && sifreTekSayi < 15{
                    
                    sifreTekGlobalCheck = true
                    print("sifretek1.asama :\(sifreTekGlobalCheck)")
                    print("sifre  tekrar 0-15 aralıgında")
                }
                else if sifreTekSayi == 0{
                    sifreTekGlobalCheck = false
                    print("sifretek1.asama :\(sifreTekGlobalCheck)")
                    sifreTekTextField.text = ""
                    sifreTekTextField.placeholder = "Sifre"
                    print("sifre terar bos")
                }
                else{
                    
                    sifreTekGlobalCheck = false
                    print("sifretek1.asama :\(sifreTekGlobalCheck)")
                    sifreTekTextField.text = ""
                    sifreTekTextField.placeholder = "Sifre"
                    print("sifre tekrar istenen aralıkta değil")
                }
                
            }
        }//sifreTF checksonu
        
        
        
        
    }//TFDidEndEditing sonu
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        view.endEditing(true)
    }//TFShouldReturn Sonu
    
}
