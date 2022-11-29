//
//  KisiselViewController.swift
//  Kan App
//
//  Created by Hüdahan Altun on 29.11.2022.
//

import UIKit


//picker ile alternatif yarat
class KisiselViewController: UIViewController {

    
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
        adTextField.keyboardType = .default
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
        
        let dokunmaAlgılama = UITapGestureRecognizer(target: self, action: #selector(self.dokunmaAlgılamaMetodu))
        
        view.addGestureRecognizer(dokunmaAlgılama)
        
    }
    

    @IBAction func ileriKButtonPressed(_ sender: UIButton) {
        
        self.performSegue(withIdentifier: K.kToKayit, sender: nil)
    }
    

}

// MARK: - textfield protocolleri

extension KisiselViewController:UITextFieldDelegate{
    
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool { //düzenlemeleye  return true ile başlıyoruz
        
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {//düzenlenmeye başlandı
        
        
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {//düzenleme retrun true ile bitecek
        <#code#>
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) { //düzenleme bitti
        
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
        
        let tamamButton = UIBarButtonItem(title: "Tamam", style: .plain, target: self, action: #selector(self.gelenTamamMetodu))
        
        let bosluk = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        
        let iptaButton = UIBarButtonItem(title: "İptal", style: .plain, target: nil, action: #selector(dgİptalMetodu))
        
        toolbar.setItems([iptaButton,bosluk,tamamButton], animated: true)
        
        dogumTextField.inputAccessoryView = toolbar
    }
    
    func kiloToolbarYukle(toolbar:UIToolbar){
        
        toolbar.backgroundColor = UIColor(rgb:0xFEFCF3)
        toolbar.tintColor = .black
        toolbar.sizeToFit()
        
        let tamamButton = UIBarButtonItem(title: "Tamam", style: .plain, target: self, action: #selector(self.gelenTamamMetodu))
        
        let bosluk = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        
        let iptaButton = UIBarButtonItem(title: "İptal", style: .plain, target: nil, action: #selector(kiloİptalMetodu))
        
        toolbar.setItems([iptaButton,bosluk,tamamButton], animated: true)
        
        kilotextField.inputAccessoryView = toolbar
    }
    
    func boyToolbarYukle(toolbar:UIToolbar){
        
        toolbar.backgroundColor = UIColor(rgb:0xFEFCF3)
        toolbar.tintColor = .black
        toolbar.sizeToFit()
        
        let tamamButton = UIBarButtonItem(title: "Tamam", style: .plain, target: self, action: #selector(self.gelenTamamMetodu))
        
        let bosluk = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        
        let iptaButton = UIBarButtonItem(title: "İptal", style: .plain, target: nil, action: #selector(boyİptalMetodu))
        
        toolbar.setItems([iptaButton,bosluk,tamamButton], animated: true)
        
        boyTextField.inputAccessoryView = toolbar
    }
    
    func cinsiyetToolbarYukle(toolbar:UIToolbar){
        
        toolbar.backgroundColor = UIColor(rgb:0xFEFCF3)
        toolbar.tintColor = .black
        toolbar.sizeToFit()
        
        let tamamButton = UIBarButtonItem(title: "Tamam", style: .plain, target: self, action: #selector(self.gelenTamamMetodu))
        
        let bosluk = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        
        let iptaButton = UIBarButtonItem(title: "İptal", style: .plain, target: nil, action: #selector(cinsiyetİptalMetodu))
        
        toolbar.setItems([iptaButton,bosluk,tamamButton], animated: true)
        
        cinsiyetTextField.inputAccessoryView = toolbar
    }
    
    func KanToolbarYukle(toolbar:UIToolbar){
        
        toolbar.backgroundColor = UIColor(rgb:0xFEFCF3)
        toolbar.tintColor = .black
        toolbar.sizeToFit()
        
        let tamamButton = UIBarButtonItem(title: "Tamam", style: .plain, target: self, action: #selector(self.gelenTamamMetodu))
        
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
    }
    
    @objc func gelenTamamMetodu(){
        
        view.endEditing(true)
    }
    
    @objc func dgİptalMetodu(){
        
        dogumTextField.text = ""
        dogumTextField.placeholder = "Dogum Tarihi"
        view.endEditing(true)
        
    }
    
    @objc func kiloİptalMetodu(){
        
        kilotextField.text = ""
        kilotextField.placeholder = "Kilo (kg)"
        view.endEditing(true)
        
    }
    @objc func boyİptalMetodu(){
        
        boyTextField.text = ""
        boyTextField.placeholder = "Boy (cm)"
        view.endEditing(true)
        
    }
    @objc func cinsiyetİptalMetodu(){
        
        cinsiyetTextField.text = ""
        cinsiyetTextField.placeholder = "Cinsiyet"
        view.endEditing(true)
        
    }
    @objc func kanİptalMetodu(){
        
        kanGrupTextField.text = ""
        kanGrupTextField.placeholder = "Kan Grubu"
        view.endEditing(true)
        
    }
}



//MARK: - Dokunma Algılama Fonksiyonu

extension KisiselViewController{
    
    @objc func dokunmaAlgılamaMetodu(){
        
        view.endEditing(true)
    }
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
            
            self.kilotextField.text = String(kiloVeriDizisi[row])
            
        }
        else if pickerView == boyPicker{
            
            self.boyTextField.text = String(boyVeriDizisi[row])
        }
        else if pickerView == cinsiyetPicker{
            
            self.cinsiyetTextField.text = cinsiyetVeri[row]
        }
        else if pickerView == kanGrupPicker{
            
            self.kanGrupTextField.text = kanGrupVerisi[row]
        }
    }
    
}

