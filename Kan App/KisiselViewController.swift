//
//  KisiselViewController.swift
//  Kan App
//
//  Created by Hüdahan Altun on 29.11.2022.
//

import UIKit


//picker ile alternatif yarat
class KisiselViewController: UIViewController {

    
    @IBOutlet weak var adCheckImageView: UIImageView!
    @IBOutlet weak var soyadCheckImageView: UIImageView!
    @IBOutlet weak var tcCheckImageView: UIImageView!
    @IBOutlet weak var dgCheckImageView: UIImageView!
    @IBOutlet weak var kiloCheckImageView: UIImageView!
    @IBOutlet weak var boyCheckImageView: UIImageView!
    @IBOutlet weak var cinsCheckImageView: UIImageView!
    @IBOutlet weak var kanCheckImageView: UIImageView!
    @IBOutlet weak var sehirCheckImageView: UIImageView!
    @IBOutlet weak var ilceCheckImageView: UIImageView!
    
    
    @IBOutlet weak var ileriKButton: UIButton!
    

    @IBOutlet weak var adTextField: UITextField!
    @IBOutlet weak var soyadTextField: UITextField!
    @IBOutlet weak var tcTextField: UITextField!
    @IBOutlet weak var dogumTextField: UITextField!
    @IBOutlet weak var kilotextField: UITextField!
    @IBOutlet weak var boyTextField: UITextField!
    @IBOutlet weak var cinsiyetTextField: UITextField!
    @IBOutlet weak var kanGrupTextField: UITextField!
    @IBOutlet weak var sehirTextField: UITextField!
    @IBOutlet weak var ilceTextField: UITextField!
    
    @IBOutlet weak var kisiselProgressView: UIProgressView!
    
    //Picker nesneleri
    
    var dgDatePicker = UIDatePicker()
    var kiloPicker = UIPickerView()
    var boyPicker = UIPickerView()
    var cinsiyetPicker = UIPickerView()
    var kanGrupPicker = UIPickerView()
    
    //Picker Buton toolbar
    
    var dgToolbar = UIToolbar()
    var kiloToolbar = UIToolbar()
    var boyToolbar = UIToolbar()
    var cinsiyetToolbar = UIToolbar()
    var kanToolbar = UIToolbar()
    
    //YerelTutucular
    
    var kiloVeriDizisi:[Int] = [Int]()
    var boyVeriDizisi:[Int] = [Int]()
    var cinsiyetVeri:[String] = ["Bay","Bayan"]
    var kanGrupVerisi:[String] = ["A+","A-","B+","B-","AB+","AB-","0+","0-"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        adCheckImageView.alpha = 0
        soyadCheckImageView.alpha = 0
        tcCheckImageView.alpha = 0
        dgCheckImageView.alpha = 0
        kiloCheckImageView.alpha = 0
        boyCheckImageView.alpha = 0
        cinsCheckImageView.alpha = 0
        kanCheckImageView.alpha = 0
        sehirCheckImageView.alpha = 0
        ilceCheckImageView.alpha = 0
        
        
        adTextField.keyboardType = .default
        adTextField.returnKeyType = .done
        adTextField.autocorrectionType = .no
        adTextField.autocapitalizationType = .none
        soyadTextField.keyboardType = .default
        soyadTextField.autocorrectionType = .no
        soyadTextField.autocapitalizationType = .none
        tcTextField.keyboardType = .numberPad
        
        
        dgPickerYukle()
        dgToolbarYukle(toolbar: dgToolbar)
        kiloPicker.delegate = self
        kiloPicker.dataSource = self
        
        boyPicker.delegate = self
        boyPicker.dataSource = self
        
        cinsiyetPicker.delegate = self
        cinsiyetPicker.dataSource = self
        
        kanGrupPicker.delegate = self
        kanGrupPicker.dataSource = self
        
        
        kiloPickerYukle()
        kiloToolbarYukle(toolbar: kiloToolbar)
        boyPickerYukle()
        boyToolbarYukle(toolbar: boyToolbar)
        cinsiyetPickerYukle()
        cinsiyetToolbarYukle(toolbar: cinsiyetToolbar)
        kanGrupPickerYukle()
        KanToolbarYukle(toolbar: kanToolbar)
        
        
        adTextField.delegate = self
        soyadTextField.delegate = self
        tcTextField.delegate = self
        
//        let dokunmaAlgılama = UITapGestureRecognizer(target: self, action: #selector(self.dokunmaAlgılamaMetodu))
//
//        view.addGestureRecognizer(dokunmaAlgılama)
//
    }
    

    @IBAction func ileriKButtonPressed(_ sender: UIButton) {
        
        self.performSegue(withIdentifier: K.kToKayit, sender: nil)
    }
    

}

// MARK: - textfield protocolleri

extension KisiselViewController:UITextFieldDelegate{
    
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool { //düzenlemeleye  return true ile başlıyoruz
        
        
        if textField == adTextField{
            
            adTextField.placeholder = "2-40 karakter aralığında ad giriniz"
        
//            adTextField.reloadInputViews()
        }
        else if textField == soyadTextField{
            
            soyadTextField.placeholder = "2-30 karakter aralığında soyad giriniz"
        }
        else if textField == tcTextField{
            
            tcTextField.placeholder = "11 Haneli TC kimlik numaranızı giriniz"
        }
        else if textField == dogumTextField{
            
            dogumTextField.placeholder = "Dogum Tarihi"
        }
        
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {//düzenlenmeye başlandı
        
        
        
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {//düzenleme retrun true ile bitecek
        
        if textField == adTextField{
            
            if textField.text == ""{
                
                adTextField.placeholder = "Ad"
            }
            
//            if let adSayı = textField.text?.count{
//
//                if (adSayı < 40){
//
//                    print("tamamdır.")
//
//                    //tik kontrolü
//                }
//                else if (adSayı > 40){
//
//
//                    textField.placeholder = "Girilen ad 40 karakteri aşıyor."
//                    textField.text = ""
//                }
//            }

        }
        else if textField == soyadTextField{
            
            if textField.text == ""{
                
                soyadTextField.placeholder = "Soyad"
            }
        }
        else if textField == tcTextField{
            
            if textField.text == ""{
                
                tcTextField.placeholder = "Ad"
            }
        }
        
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) { //düzenleme bitti
        
        if textField == adTextField{
            
            if let adSayı = textField.text?.count{
                
                if (adSayı < 30) && (adSayı > 2){
                    
                    print("ad karakter sayısı istenen aralıkta")
                    
                    UIView.animate(withDuration: 0.5, animations: {
                        
                        self.adCheckImageView.alpha = 1
                    })
                }
                else if adSayı == 0{
                    
                    adTextField.placeholder = "Ad"
                    
                    UIView.animate(withDuration: 0.5, animations: {
                        
                        self.adCheckImageView.alpha = 0
                    })
                }
                
                else{
                    
                    UIView.animate(withDuration: 0.5, animations: {
                        
                        self.adCheckImageView.alpha = 0
                    })
                    textField.placeholder = "ad 2-30 arasında olmalıdır"
                    textField.text = ""
                }
            }
        }//adtextfieldSonu
        else  if textField == soyadTextField{
            
            if let soyadSayı = textField.text?.count{
                
                if (soyadSayı < 25) && (soyadSayı > 2){
                    
                    print("soyad karakter sayısı istenen aralıkta")
                    
                    UIView.animate(withDuration: 0.5, animations: {
                        
                        self.soyadCheckImageView.alpha = 1
                    })
                    
                }
                else if soyadSayı == 0{
                    
                    UIView.animate(withDuration: 0.5, animations: {
                        
                        self.soyadCheckImageView.alpha = 0
                    })
                    
                    soyadTextField.placeholder = "Soyad"
                    
                }
                
                else{
                    
                    UIView.animate(withDuration: 0.5, animations: {
                        
                        self.soyadCheckImageView.alpha = 0
                    })
                    textField.placeholder = "soyad 2-25 arasında olmalıdır"
                    textField.text = ""
                }
            }
        }//soyadtextfield sonu
        else if textField == tcTextField{
            
            if let tcSayı = textField.text?.count{
                
                if tcSayı == 11{
                    
                    print("tc 11 haneli")
                    
                    UIView.animate(withDuration: 0.5, animations: {
                        
                        self.tcCheckImageView.alpha = 1
                    })
                }
                else if tcSayı == 0{
                    
                    UIView.animate(withDuration: 0.5, animations: {
                        
                        self.tcCheckImageView.alpha = 0
                    })
                    tcTextField.placeholder = "TC"
                    
                }
                else{
                    
                    UIView.animate(withDuration: 0.5, animations: {
                        
                        self.tcCheckImageView.alpha = 0
                    })
                    textField.placeholder = "TC 11 haneli olmalıdır"
                    textField.text = ""
                }
                
            }
            
        }//tctextfieldSonu
//        else if textField == dogumTextField{
//
//            if let dgSayı = textField.text?.count{
//
//                if dgSayı == 0{
//
//                    UIView.animate(withDuration: 0.5, animations: {
//
//                        self.dgCheckImageView.alpha = 0
//                    })
//
//                }
//                else{
//
//                    UIView.animate(withDuration: 0.5, animations: {
//
//                        self.dgCheckImageView.alpha = 1
//                    })
//                }
//            }
//
//        }//dogumtextfield sonu
//        else if textField == kilotextField{
//
//
//        }//kilotextfiled sonu
//        else if textField == boyTextField{
//
//
//        }//boytextfield sonu
//        else if textField == cinsiyetTextField{
//
//
//        }//cinsiyettextfield sonu
//        else if textField == kanGrupTextField{
//
//
//        }//kangruptextfield sonu
//        else if textField == sehirTextField{
//
//
//        }//sehirtextfiled sonu
//        else if textField == ilceTextField{
//
//
//        }//ilce textfield sonu
//
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if textField == adTextField{
            
            UIView.animate(withDuration: 0.5, animations: {
                
                self.adCheckImageView.alpha = 1
            })
            view.endEditing(true)
        }
        else if textField == soyadTextField{
            
            UIView.animate(withDuration: 0.5, animations: {
                
                self.soyadCheckImageView.alpha = 1
            })
            view.endEditing(true)
        }
        else if textField == tcTextField{
            
            UIView.animate(withDuration: 0.5, animations: {
                
                self.tcCheckImageView.alpha = 1
            })
            view.endEditing(true)
        }
        
        
        return true
    }
    
    
}

//MARK: - Picker Fonksiyonları ve Ojective-C temelli fonksiyonlar


extension KisiselViewController{
    
    func dgPickerYukle(){
        
        if #available(İOS 13.4,*){
            
            dgDatePicker.preferredDatePickerStyle = .wheels
        }
        
        dgDatePicker.datePickerMode = .date
        dogumTextField.inputView = dgDatePicker
        
        dgDatePicker.addTarget(self, action: #selector(self.tarihGoster(dateVeri:)), for: .valueChanged)

    }
    
    func kiloPickerYukle(){
        
        for i in 50...130{
            
            kiloVeriDizisi.append(i)
        }
        
        kilotextField.inputView = kiloPicker
        
        
        
    }
    
    func boyPickerYukle(){
        
        for i in 120...210{
            
            boyVeriDizisi.append(i)
        }
        
        boyTextField.inputView = boyPicker
    }
    
    func cinsiyetPickerYukle(){
        
        cinsiyetTextField.inputView = cinsiyetPicker
    }
    
    func kanGrupPickerYukle(){
        
        kanGrupTextField.inputView = kanGrupPicker
    }
    
    func dgToolbarYukle(toolbar:UIToolbar){
        
        toolbar.backgroundColor = UIColor(rgb:0xFEFCF3)
        toolbar.tintColor = .black
        toolbar.sizeToFit()
        
        let tamamButton = UIBarButtonItem(title: "Tamam", style: .plain, target: self, action: #selector(self.dgTamamMetodu))
        
        let bosluk = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        
        let iptaButton = UIBarButtonItem(title: "İptal", style: .plain, target: nil, action: #selector(dgİptalMetodu))
        
        toolbar.setItems([iptaButton,bosluk,tamamButton], animated: true)
        
        dogumTextField.inputAccessoryView = toolbar
    }
    
    func kiloToolbarYukle(toolbar:UIToolbar){
        
        toolbar.backgroundColor = UIColor(rgb:0xFEFCF3)
        toolbar.tintColor = .black
        toolbar.sizeToFit()
        
        let tamamButton = UIBarButtonItem(title: "Tamam", style: .plain, target: self, action: #selector(self.kiloTamamMetodu))
        
        let bosluk = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        
        let iptaButton = UIBarButtonItem(title: "İptal", style: .plain, target: nil, action: #selector(kiloİptalMetodu))
        
        toolbar.setItems([iptaButton,bosluk,tamamButton], animated: true)
        
        kilotextField.inputAccessoryView = toolbar
    }
    
    func boyToolbarYukle(toolbar:UIToolbar){
        
        toolbar.backgroundColor = UIColor(rgb:0xFEFCF3)
        toolbar.tintColor = .black
        toolbar.sizeToFit()
        
        let tamamButton = UIBarButtonItem(title: "Tamam", style: .plain, target: self, action: #selector(self.boyTamamMetodu))
        
        let bosluk = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        
        let iptaButton = UIBarButtonItem(title: "İptal", style: .plain, target: nil, action: #selector(boyİptalMetodu))
        
        toolbar.setItems([iptaButton,bosluk,tamamButton], animated: true)
        
        boyTextField.inputAccessoryView = toolbar
    }
    
    func cinsiyetToolbarYukle(toolbar:UIToolbar){
        
        toolbar.backgroundColor = UIColor(rgb:0xFEFCF3)
        toolbar.tintColor = .black
        toolbar.sizeToFit()
        
        let tamamButton = UIBarButtonItem(title: "Tamam", style: .plain, target: self, action: #selector(self.cinsiyetTamamMetodu))
        
        let bosluk = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        
        let iptaButton = UIBarButtonItem(title: "İptal", style: .plain, target: nil, action: #selector(cinsiyetİptalMetodu))
        
        toolbar.setItems([iptaButton,bosluk,tamamButton], animated: true)
        
        cinsiyetTextField.inputAccessoryView = toolbar
    }
    
    func KanToolbarYukle(toolbar:UIToolbar){
        
        toolbar.backgroundColor = UIColor(rgb:0xFEFCF3)
        toolbar.tintColor = .black
        toolbar.sizeToFit()
        
        let tamamButton = UIBarButtonItem(title: "Tamam", style: .plain, target: self, action: #selector(self.kanTamamMetodu))
        
        let bosluk = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        
        let iptaButton = UIBarButtonItem(title: "İptal", style: .plain, target: nil, action: #selector(kanİptalMetodu))
        
        toolbar.setItems([iptaButton,bosluk,tamamButton], animated: true)
        
        kanGrupTextField.inputAccessoryView = toolbar
    }
    
    @objc func tarihGoster(dateVeri:UIDatePicker){
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        let alınanTarihSonHal = dateFormatter.string(from: self.dgDatePicker.date)
        
        dogumTextField.text = alınanTarihSonHal
        
        UIView.animate(withDuration: 0.5, animations: {
            
            self.dgCheckImageView.alpha = 1
        })
    }
    
    @objc func dgTamamMetodu(){
        UIView.animate(withDuration: 0.5, animations: {

            self.dgCheckImageView.alpha = 1
        })
        view.endEditing(true)
    }
    
    @objc func kiloTamamMetodu(){
//        UIView.animate(withDuration: 0.5, animations: {
//
//            self.kiloCheckImageView.alpha = 1
//        })
        view.endEditing(true)
    }

    @objc func boyTamamMetodu(){
//        UIView.animate(withDuration: 0.5, animations: {
//
//            self.boyCheckImageView.alpha = 1
//        })
        view.endEditing(true)
    }

    @objc func cinsiyetTamamMetodu(){
//        UIView.animate(withDuration: 0.5, animations: {
//
//            self.cinsCheckImageView.alpha = 1
//        })
        view.endEditing(true)
    }

    @objc func kanTamamMetodu(){
//        UIView.animate(withDuration: 0.5, animations: {
//
//            self.kanCheckImageView.alpha = 1
//        })
        view.endEditing(true)
    }

    
    @objc func dgİptalMetodu(){
        
        dogumTextField.text = ""
        dogumTextField.placeholder = "Dogum Tarihi"
        
        UIView.animate(withDuration: 0.5, animations: {
            
            self.dgCheckImageView.alpha = 0
        })
        view.endEditing(true)
        
    }
    
    @objc func kiloİptalMetodu(){
        
        kilotextField.text = ""
        kilotextField.placeholder = "Kilo (kg)"
        
        UIView.animate(withDuration: 0.5, animations: {
            
            self.kiloCheckImageView.alpha = 0
        })
        view.endEditing(true)
        
    }
    @objc func boyİptalMetodu(){
        
        boyTextField.text = ""
        boyTextField.placeholder = "Boy (cm)"
        UIView.animate(withDuration: 0.5, animations: {
            
            self.boyCheckImageView.alpha = 0
        })
        view.endEditing(true)
        
    }
    @objc func cinsiyetİptalMetodu(){
        
        cinsiyetTextField.text = ""
        cinsiyetTextField.placeholder = "Cinsiyet"
        
        UIView.animate(withDuration: 0.5, animations: {
            
            self.cinsCheckImageView.alpha = 0
        })
        view.endEditing(true)
        
    }
    @objc func kanİptalMetodu(){
        
        kanGrupTextField.text = ""
        kanGrupTextField.placeholder = "Kan Grubu"
        UIView.animate(withDuration: 0.5, animations: {
            
            self.kanCheckImageView.alpha = 0
        })
        view.endEditing(true)
        
    }
}



//MARK: - Dokunma Algılama Fonksiyonu

extension KisiselViewController{
    
//    @objc func dokunmaAlgılamaMetodu(){
//
//        view.endEditing(true)
//    }
}

//MARK: - Picker Protocolleri



extension KisiselViewController:UIPickerViewDelegate,UIPickerViewDataSource{
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        var returnValue:Int?
        
        if pickerView == kiloPicker{
            
            returnValue = kiloVeriDizisi.count
        }
        else if pickerView == boyPicker{
            
            returnValue = boyVeriDizisi.count
        }
        else if pickerView == cinsiyetPicker{
            
            returnValue = cinsiyetVeri.count
        }
        else if pickerView == kanGrupPicker{
            
            returnValue = kanGrupVerisi.count
        }
        return returnValue!
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
     
        var returnValue:String?
        
        if pickerView == kiloPicker{
            
            returnValue = String(self.kiloVeriDizisi[row])
            
        }
        else if pickerView == boyPicker{
            
            returnValue = String(self.boyVeriDizisi[row])
        }
        else if pickerView == cinsiyetPicker{
            
            returnValue = cinsiyetVeri[row]
        }
        else if pickerView == kanGrupPicker{
            
            returnValue = kanGrupVerisi[row]
        }
        
        return returnValue
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        if pickerView == kiloPicker{
            
            UIView.animate(withDuration: 0.5, animations: {
                
                self.kiloCheckImageView.alpha = 1
            })
            
            self.kilotextField.text = String(kiloVeriDizisi[row])
            
        }
        else if pickerView == boyPicker{
            UIView.animate(withDuration: 0.5, animations: {
                
                self.boyCheckImageView.alpha = 1
            })
            
            self.boyTextField.text = String(boyVeriDizisi[row])
        }
        else if pickerView == cinsiyetPicker{
            
            UIView.animate(withDuration: 0.5, animations: {
                
                self.cinsCheckImageView.alpha = 1
            })
            
            self.cinsiyetTextField.text = cinsiyetVeri[row]
        }
        else if pickerView == kanGrupPicker{
            
            UIView.animate(withDuration: 0.5, animations: {
                
                self.kanCheckImageView.alpha = 1
            })
            self.kanGrupTextField.text = kanGrupVerisi[row]
        }
        

    }
    
}

