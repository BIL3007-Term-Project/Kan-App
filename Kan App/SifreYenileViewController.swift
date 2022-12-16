//
//  SifreYenileViewController.swift
//  Kan App
//
//  Created by Hüdahan Altun on 16.12.2022.
//

import UIKit

class SifreYenileViewController: UIViewController {

    @IBOutlet weak var eskiSifreTextField: UITextField!
    
    @IBOutlet weak var yeniSifreTextField: UITextField!
    
    @IBOutlet weak var sifreTekTextField: UITextField!
    
    @IBOutlet weak var sifreGosterButton: UIButton!
    
    @IBOutlet weak var sifreGImageView: UIImageView!
    
    var eskiSifreKayitCheck:Bool?
    var yeniSifreKayitCheck:Bool?
    var sifreTekKayitCheck:Bool?
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    

    
    @IBAction func sifreGosterPressed(_ sender: Any) {
        
        
        
    }
    
//    @IBAction func DegisiklikOnaylaPressed(_ sender: Any) {
//        
//        
//        if let eSifre = eskiSifreTextField.text, let ysifre = yeniSifreTextField.text, let sifreTkr = sifreTekTextField.text{
//
//            print("bilgiler alındı")
//            
//            if eskiSifreKayitCheck == true && yeniSifreKayitCheck == true && sifreTekKayitCheck == true{
//                
//                print("1.aşama güvenlik")
//                
//              
//                
//                
//                if check1 == true && check2 == true && sifre == sifreTkr{
//                    //2.asama güvenlik
//                    //mail ve sifre istenen özelliklere sahip ayrıca sifre ile sifre tekrarı bir eşit.
//                    
//                    print("2.aşama güvenlik")
//                   
//                    
//                    
//                     mobilKullaniciKayitCheck = kullanicilarDAO().mobilKullaniciEkle(k_mail: mail, k_sifre: sifre, k_ad: gelenNesne.getK_Ad(), k_soyad: gelenNesne.getK_Soyad(), k_tc: gelenNesne.getK_TC(), k_tel: gelenNesne.getK_Tel(), k_dogumgunu: gelenNesne.getK_dogumgunu(), k_kilo: gelenNesne.getK_Kilo(), k_boy: gelenNesne.getK_Boy(), k_cinsiyet: gelenNesne.getK_Cinsiyet(), k_kangrup: gelenNesne.getK_Kangrup())
//                    
//                    if mobilKullaniciKayitCheck == true{
//                        
//                        print("kullanıcı başarıyla veritabanına eklendi geçiş yapılacak")
//                        DispatchQueue.main.async {
//                            self.activityIndicator.alpha = 1
//                            self.activityIndicator.startAnimating()
//                        }
//                        
//                        Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(mainVCGecisYap), userInfo: nil, repeats: false)
//                        
//                        
//                        
//                    }else{
//                        
//                        hesapOlusturmaAlert()
//                        
//                    }
//                    
//                    
//                }else{
//                    
//                    bilgilerYanlisAlert()
//                    
//                }
//            }else{
//                
//                bosAlanHatası()
//                
//            }
//        }else{
//            
//            bosAlanHatası()
////
//            
//        }
//        
//        
//    }
    
    
}
