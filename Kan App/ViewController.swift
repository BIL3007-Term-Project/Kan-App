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
    
    @IBOutlet weak var VCActivityIndicator: UIActivityIndicatorView!
    
    @IBOutlet weak var emailImageView: UIImageView!
    
    @IBOutlet weak var sifreImageView: UIImageView!
    
    
    
    @IBOutlet weak var sifreGButton: UIButton!
    @IBOutlet weak var sifreGImageView: UIImageView!
    
    var hesapSahibiMail:String?
    
    var sifreGorunuyorMu:Bool?
    
    
    var textLabel:String = "Kan Application"
    
    //t
    var mailGirisCheck:Bool = false
    var sifreGirisCheck:Bool = false
    
    //MARK: - iOS döngü fonksiyonları
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
   
        sifreGImageView.image = UIImage(systemName: "eye.slash")
        
        VCActivityIndicator.color = .white
        emailTextField.delegate = self
        sifreTextField.delegate = self
        bilgiLabel.alpha = 0
        kayıtButton.alpha = 0
        VCActivityIndicator.alpha = 0
        
        emailTextField.alpha = 1
        sifreTextField.alpha = 1
        emailImageView.alpha = 1
        sifreImageView.alpha = 1
        girisButton.alpha = 1
        
        emailTextField.keyboardType = .default
        emailTextField.autocorrectionType = .no
        emailTextField.autocapitalizationType = .none
        emailTextField.returnKeyType = .done
        sifreTextField.returnKeyType = .done
        
        sifreGorunuyorMu = false
        sifreTextField.isSecureTextEntry = true
        
        girisButton.tintColor = UIColor(rgb: 0x393E46)
        kayıtButton.tintColor = UIColor(rgb: 0x393E46)
        
        ozelVeritabaniKopyala()
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == K.gToMain{
            
            if let sahipMail = sender as? String{
                
                print("mail gitti! mail:\(sahipMail)")
                let gidilecekVC = segue.destination as? MainViewController
                gidilecekVC?.hesapSahibi = sahipMail
                
                
            }
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        
//        bilgiLabel.alpha = 0
//        kayıtButton.alpha = 0
//
//        emailTextField.alpha = 1
//        sifreTextField.alpha = 1
//        girisButton.alpha = 1
//
        sifreGorunuyorMu = false
        girisButton.layer.cornerRadius = girisButton.frame.height/3
        kayıtButton.layer.cornerRadius = kayıtButton.frame.height/3
        runNameAnimation()

    }
    
    override func viewDidDisappear(_ animated: Bool) {
        
        VCActivityIndicator.stopAnimating()
        VCActivityIndicator.alpha = 0
    }
    
    

    
    //MARK: - Button actionları
    
    
    @IBAction func sifreGosterPressed(_ sender: Any) {
        
        if sifreGorunuyorMu!{ //şifre açık
            
            sifreTextField.isSecureTextEntry = true
            sifreGImageView.image = UIImage(systemName: "eye.slash")
            
            sifreGorunuyorMu = false
            
        }else{
            
            sifreTextField.isSecureTextEntry = false
            sifreGImageView.image = UIImage(systemName: "eye")
            
            sifreGorunuyorMu = true
        }
        

    }
    
    
    
    
    @IBAction func twoSVPressed(_ sender: UISegmentedControl) {
        
        if sender.selectedSegmentIndex == 0{//giris yap secili
            
            bilgiLabel.alpha = 0
            kayıtButton.alpha = 0
            
            emailTextField.alpha = 1
            sifreTextField.alpha = 1
            emailImageView.alpha = 1
            sifreImageView.alpha = 1
            sifreGButton.alpha = 1
            sifreGImageView.alpha = 1
            girisButton.alpha = 1
        }
        
        if sender.selectedSegmentIndex == 1{//kayıt ol secili
            
            bilgiLabel.alpha = 1
            kayıtButton.alpha = 1
            
            emailTextField.alpha = 0
            sifreTextField.alpha = 0
            emailImageView.alpha = 0
            sifreImageView.alpha = 0
            sifreGButton.alpha = 0
            sifreGImageView.alpha = 0
            girisButton.alpha = 0
            
        }
    }
    
    //
    @IBAction func girisButtonPressed(_ sender: UIButton) {
        
        var dbGelenMobilKul:mobilKullanicilar?
        
        if let mail = emailTextField.text , let sifre = sifreTextField.text{
            
            if mailGirisCheck == true && sifreGirisCheck == true{
                
                //animasyon çalışır
               
                
                dbGelenMobilKul = kullanicilarDAO().MobilKullaniciGetir(k_mail: mail)
                
                if mail == dbGelenMobilKul?.getK_Mail() && sifre == dbGelenMobilKul?.getK_Sifre(){
                    
                    DispatchQueue.main.async {
                        self.VCActivityIndicator.alpha = 1
                        self.VCActivityIndicator.startAnimating()
                    }
                    
                    hesapSahibiMail = mail
                    
                    Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(mainGecisYap), userInfo: nil, repeats: false)
                   
                    
                    
                }else{
                    
                    bilgilerYanlisAlert()
                }
                //2 sn içinde geçiş yapılır.burası 2.sql güvenlik katmanının için e koyulacak
                
            }else{
                
                bosAlanHatası()
            }
            
        }else{
            
            bosAlanHatası()
        }
        
        
    }
    
    
    @IBAction func kayıtButtonPressed(_ sender: UIButton) {
        
        self.performSegue(withIdentifier: K.gToYasal, sender: nil)
    }
    
    
    @IBAction func sifreUnButtonPressed(_ sender: UIBarButtonItem) {
        
        self.performSegue(withIdentifier: K.gToSifreUnut, sender: nil)
        
    }
    
  
    
    
    @objc func mainGecisYap(){

        self.performSegue(withIdentifier: K.gToMain, sender: hesapSahibiMail)

    }

 

}
extension ViewController{
    
    
    func ozelVeritabaniKopyala(){
       
        let bundleYolu = Bundle.main.path(forResource: "bagiscilar", ofType: ".sqlite")
        
        let hedefYol = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        
        let fileManager = FileManager.default
        
        let kopyala = URL(fileURLWithPath: hedefYol).appendingPathComponent("bagiscilar.sqlite")
        
        if fileManager.fileExists(atPath: kopyala.path){
            
            print("veritabanı yolu\(kopyala.path)")
            print("bagiscilar veritabanı zaten kopyalandı")
        }else{
            
            do{
                
                try fileManager.copyItem(atPath: bundleYolu!, toPath: kopyala.path)
                print("bagiscilar veritabanı kopyalama başarılı!")
                
            }catch{
                
                print("bagiscilar veritabanı kopyalamada hata!")
            }
        }
        
    }
    
    func ortakVeriTabanikopyala(){
        
        let bundleYolu = Bundle.main.path(forResource: "db", ofType: ".sqlite3")
        
        let hedefYol = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        
        let fileManager = FileManager.default
        
        let kopyala = URL(fileURLWithPath: hedefYol).appendingPathComponent("db.sqlite3")
        
        if fileManager.fileExists(atPath: kopyala.path){
            
            print(kopyala.path)
            print("ortak veritabanı zaten kopyalandı")
        }else{
            
            do{
                
                try fileManager.copyItem(atPath: bundleYolu!, toPath: kopyala.path)
                print("ortak veritabanı kopyalama başarılı!")
                
            }catch{
                
                print("ortak veritabanı kopyalamada hata!")
            }
        }
    }
}
//MARK: - animasyon fonksiyonları
extension ViewController{
    
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
