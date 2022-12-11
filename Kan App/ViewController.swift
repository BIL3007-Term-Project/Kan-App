//
//  ViewController.swift
//  Kan App
//
//  Created by Hüdahan Altun on 29.11.2022.
//

import UIKit

class ViewController: UIViewController { //giriş ekranı VC

    @IBOutlet weak var sifreUnButton: UIBarButtonItem!
    
    @IBOutlet weak var appİmage: UIImageView!
    
    @IBOutlet weak var appName: UILabel!
    
    @IBOutlet weak var twoSegmentedView: UISegmentedControl!
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var sifreTextField: UITextField!
    
    @IBOutlet weak var girisButton: UIButton!
    
    @IBOutlet weak var kayıtButton: UIButton!
    
    @IBOutlet weak var bilgiLabel: UILabel!
    
    var textLabel:String = "Kan Application"
    
    
    var mailGirisCheck:Bool = false
    var sifreGirisCheck:Bool = false
    //MARK: - iOS döngü fonksiyonları
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
   
        emailTextField.delegate = self
        sifreTextField.delegate = self
        bilgiLabel.alpha = 0
        kayıtButton.alpha = 0
        
        emailTextField.alpha = 1
        sifreTextField.alpha = 1
        girisButton.alpha = 1
        
        emailTextField.keyboardType = .default
        emailTextField.autocorrectionType = .no
        emailTextField.autocapitalizationType = .none
        emailTextField.returnKeyType = .done
        sifreTextField.returnKeyType = .done
        girisButton.tintColor = UIColor(rgb: 0x393E46)
        kayıtButton.tintColor = UIColor(rgb: 0x393E46)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
//        bilgiLabel.alpha = 0
//        kayıtButton.alpha = 0
//
//        emailTextField.alpha = 1
//        sifreTextField.alpha = 1
//        girisButton.alpha = 1
//
        girisButton.layer.cornerRadius = girisButton.frame.height/3
        kayıtButton.layer.cornerRadius = kayıtButton.frame.height/3
        runNameAnimation()

    }
    
    

    
    //MARK: - Button actionları
    
    @IBAction func twoSVPressed(_ sender: UISegmentedControl) {
        
        if sender.selectedSegmentIndex == 0{
            
            bilgiLabel.alpha = 0
            kayıtButton.alpha = 0
            
            emailTextField.alpha = 1
            sifreTextField.alpha = 1
            girisButton.alpha = 1
        }
        
        if sender.selectedSegmentIndex == 1{
            
            bilgiLabel.alpha = 1
            kayıtButton.alpha = 1
            
            emailTextField.alpha = 0
            sifreTextField.alpha = 0
            girisButton.alpha = 0
            
        }
    }
    
    //
    @IBAction func girisButtonPressed(_ sender: UIButton) {
        
        veriDoğrula(emailTF: emailTextField, sifreTF: sifreTextField)
        
        
    }
    
    
    @IBAction func kayıtButtonPressed(_ sender: UIButton) {
        
        self.performSegue(withIdentifier: K.gToYasal, sender: nil)
    }
    
    
    @IBAction func sifreUnButtonPressed(_ sender: UIBarButtonItem) {
        
        self.performSegue(withIdentifier: K.gToSifre, sender: nil)
    }
    
    //MARK: - Giris hesap kontrol fonksiyonu
    
    func veriDoğrula(emailTF:UITextField,sifreTF:UITextField){
        
        if let id = emailTF.text , let sifre = sifreTF.text{
            
            if mailGirisCheck == true && sifreGirisCheck == true{
                
                
                
                self.performSegue(withIdentifier: K.gToMain, sender: nil)
                
            }else{
                
                bosAlanHatası()
            }
            
        }else{
            
            bosAlanHatası()
        }
        
        
        
    }
    
    func runNameAnimation(){//giriş yazı animasyon fonksiyonu
        
        appName.alpha = 1
        appName.text = ""
        
        var charIndex = 0.0
        for letter in textLabel{
            
            Timer.scheduledTimer(withTimeInterval: 0.1 * charIndex, repeats: false){
                
                timer in
                
                self.appName.text?.append(letter)
                
            }
            charIndex += 1
        }
        
        UIView.animate(withDuration: 2, delay: 1, options: [.repeat,.autoreverse] , animations: {
             
            self.appName.alpha = 0.1
            
        })
    }
    

}

extension ViewController{
    
    func bilgilerYanlisAlert(){
        
        let alertController = UIAlertController(title: "Hesap Güvenliği", message: K.bilgYanlis, preferredStyle: .alert)
        
        let tamamButton = UIAlertAction(title: "Tamam", style: .cancel)
        
        alertController.addAction(tamamButton)
        
        self.present(alertController, animated: true)
        
    }
    
    func bosAlanHatası(){
        
        let alertController = UIAlertController(title: "Hesap Güvenliği", message: K.bosAlanHata, preferredStyle: .alert)
        
        let tamamButton = UIAlertAction(title: "Tamam", style: .cancel)
        
        alertController.addAction(tamamButton)
        
        emailTextField.text = ""
        sifreTextField.text = ""
        self.present(alertController, animated: true)
        
    }
    
}
//MARK: - textfieldDelegate protocolleri

extension ViewController:UITextFieldDelegate{
    
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        
        if textField == emailTextField{
            
            textField.placeholder = "Email"
        }
        else if textField == sifreTextField{
            
            textField.placeholder = "Sifre"
        }
        return true
    }//TFShouldBeginEditing sonu
    
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
    }
    
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
        
        return true
        
    }//TFShouldEndEditing sonu
    
    func textFieldDidEndEditing(_ textField: UITextField) {


        if textField == emailTextField{

            if let mailSayi = textField.text?.count{

                if mailSayi > 11 && mailSayi < 30{
                    mailGirisCheck = true
                    print("mail1.asama :\(mailGirisCheck)")
                    print("mail 11 haneden büyük 30 dan küçük istenen aralıkta")

                }
                else if mailSayi == 0{
                    mailGirisCheck = false
                    print("mail1.asama :\(mailGirisCheck)")
                    emailTextField.text = ""
                    emailTextField.placeholder = "Email"

                    print("mail boş bırakıldı")
                }
                else{
                    mailGirisCheck = false
                    print("mail1.asama :\(mailGirisCheck)")
                    emailTextField.text = ""
                    emailTextField.placeholder = "Email"

                    print("mail istenen aralıkta değil")
                }

            }
        }//emailTF check sonu
        else if textField == sifreTextField{

            if let sifreSayi = textField.text?.count{

                if sifreSayi > 0 && sifreSayi < 15{

                    sifreGirisCheck = true
                    print("sifre1.asama :\(sifreGirisCheck)")
                    print("sifre 0-15 aralıgında")
                }
                else if sifreSayi == 0{
                    sifreGirisCheck = false
                    print("sifre1.asama :\(sifreGirisCheck)")
                    sifreTextField.text = ""
                    sifreTextField.placeholder = "Sifre"
                    print("sifre bos")
                }
                else{

                    sifreGirisCheck = false
                    print("sifre1.asama :\(sifreGirisCheck)")
                    sifreTextField.text = ""
                    sifreTextField.placeholder = "Sifre"
                    print("sifre istenen aralıkta değil")
                }
            }

        }//sifreTF check sonu





    }//TFDidEndEditing sonu
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        view.endEditing(true)
    }//TFShouldReturn Sonu
    
    
    
}
