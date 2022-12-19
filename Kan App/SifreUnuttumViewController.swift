//
//  SifreUnuttumViewController.swift
//  Kan App
//
//  Created by Hüdahan Altun on 16.12.2022.
//

import UIKit

class SifreUnuttumViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var tcTextField: UITextField!
    
  
    
    @IBOutlet weak var ileriButton: UIButton!
    
    var emailKayitCheck:Bool?
    var tcKayitCheck:Bool?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    

    @IBAction func ileriButtonPressed(_ sender: Any) {
        
        
        if let mail = emailTextField.text, let tc = tcTextField.text{
            
            print("bilgiler alındı")
            
            if emailKayitCheck == true && tcKayitCheck == true{
                
                if let gMail = kullanicilarDAO().MobilKullaniciGetir(k_mail: mail).getK_Mail(){
                    
                    if mail == gMail{
                        
//                        if gelenTC = kullanicilarDAO().MobilKullaniciGetir(k_mail: gMail).getK_TC(){
//                            
//                            
//                        }
                        
                    }
                }else{
                    
                    //hesap yok
                }
                
                
            }else{
                
                
            }
            
        }else{
            
            //bosAlan
        }
                
               
        
        
    }
    
    
}


extension SifreUnuttumViewController:UITextFieldDelegate{
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        
        if textField == emailTextField{
            
            textField.placeholder = "Email"
        }
        else if textField == tcTextField{
            
            textField.placeholder = " TC no"
        }
     
        return true
    }//TFShouldBeginEditing sonu
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        
        if textField == emailTextField{
            
            if textField.text == ""{
                
                emailTextField.placeholder = "Email"
            }

        }
        else if textField == tcTextField{
            
            if textField.text == ""{
                
                tcTextField.placeholder = "TC no"
            }
        }
        
        
        return true
        
    }//TFShouldEndEditing sonu
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        
        if textField == emailTextField{
            
            if let mailSayi = textField.text?.count{
                
                if mailSayi > 0 && mailSayi < 30{
                    emailKayitCheck = true
                    print("Mail 1.asama :\(String(describing: emailKayitCheck))")
                    print("mail 0 haneden büyük 15 den küçük istenen aralıkta")
                    
                }
                else if mailSayi == 0{
                    emailKayitCheck = false
                    print("mail 1.asama :\(String(describing: emailKayitCheck))")
                    emailTextField.text = ""
                    emailTextField.placeholder = "Email"
                    
                    print("Eski Sifre boş bırakıldı")
                }
                else{
                    emailKayitCheck = false
                    print("Mail 1.asama :\(String(describing: emailKayitCheck))")
                    emailTextField.text = ""
                    emailTextField.placeholder = "Email"
                    
                    print("mail istenen aralıkta değil")
                }
                
            }
        }//EskiSifreTF check sonu
        else if textField == tcTextField{
            
            if let sifreSayi = textField.text?.count{
                
                if sifreSayi > 0 && sifreSayi < 11{
                    
                    tcKayitCheck = true
                    print("TC 1.asama :\(String(describing: tcKayitCheck))")
                    print("TC 0-15 aralıgında")
                }
                else if sifreSayi == 0{
                    tcKayitCheck = false
                    print("TC 1.asama :\(String(describing: tcTextField))")
                    tcTextField.text = ""
                    tcTextField.placeholder = "TC no"
                    print("TC bos")
                }
                else{
                    
                    tcKayitCheck = false
                    print("sifre1.asama :\(String(describing: tcKayitCheck))")
                    tcTextField.text = ""
                    tcTextField.placeholder = "TCNO"
                    print("TC istenen aralıkta değil")
                }
            }
            
        }//sifreTF check sonu
  
        
        
        
        
    }//TFDidEndEditing sonu
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        view.endEditing(true)
    }//TFShouldReturn Sonu
    
}

