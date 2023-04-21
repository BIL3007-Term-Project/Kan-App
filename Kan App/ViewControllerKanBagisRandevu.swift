//
//  ViewControllerKanBagisRandevu.swift
//  Kan App
//
//  Created by Hüdahan Altun on 21.04.2023.
//

import UIKit

class ViewControllerKanBagisRandevu: UIViewController {

    
    
    @IBOutlet weak var randevuGünTextField: UITextField!
    
    @IBOutlet weak var randevuSaatTextField: UITextField!
    
    @IBOutlet weak var randevuImageView: UIImageView!
    
    @IBOutlet weak var randevuOnaylaButton: UIButton!
    
    var randevuGünPicker:UIDatePicker = UIDatePicker()
    var randevuSaatPicker:UIPickerView = UIPickerView()
    
    var randevuSaatToolbar = UIToolbar()
    var randevuGünToolbar = UIToolbar()
   
    var randevuSaat:[String] = ["08:00","08:10","08:20","08:30","08:40","08:50",
                                       "09:00","09:10","09:20","09:30","09:40","09:50",
                                       "10:00","10:10","10:20","10:30","10:40","10:50",
                                       "11:00","11:10","11:20","11:30","11:40","11:50",
                                       "13:00","13:10","13:20","13:30","13:40","13:50",
                                       "14:00","14:10","14:20","14:30","14:40","14:50",
                                       "15:00","15:10","15:20","15:30","15:40","15:50",
                                       "16:00","16:10","16:20","16:30","16:40","16:50"]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        TFYukle()
        
        
        randevuImageView.image = UIImage(systemName:"checkmark.circle")
        randevuGunPickerYukle()
        
        randevuSaatPicker.delegate = self
        randevuSaatPicker.dataSource = self
        
        randevuImageView.alpha = 0
        
        randevuSaatPickerYukle()
        randevuSaatToolbarYukle(toolbar: randevuSaatToolbar)
        
        
//        randevuGünToolbarYukle(toolbar: randevuGünToolbar)
    }
    
    @IBAction func randevuOnaylaPressed(_ sender: Any) {
        
        if let _ = randevuSaatTextField.text, let _ = randevuGünTextField.text{
            
            print("bilgiler alındı")
            
            if randevuGünTextField.text != "" {
                
                if randevuSaatTextField.text != ""{
                    
                    randevuOnaylandı()
                    UIView.animate(withDuration: 1, delay: 1, animations: {
                        self.randevuImageView.alpha = 1
                    },completion: {
                        (true) in
                        
                        UIView.animate(withDuration: 1, delay: 0.5, animations: {
                            
                            self.randevuImageView.alpha = 0
                        })
                    })
                    
                }else{
                    saatGirinizHatası()
                    
                }
            }else{
                 
                onceGunGirinizHatası()
                
            }
        }else{
            
            bosAlanHatası()
        }
                
               
    }
    
    @IBAction func tarihleriTemizle(_ sender: Any) {
        
        randevuGünTextField.text = ""
        randevuSaatTextField.text = ""
        randevuGünTextField.placeholder = "Randevu günü seçiniz..."
        randevuSaatTextField.placeholder = "Randevu saati seçiniz"
        
    }
    
    func TFYukle(){
        randevuGünTextField.text = ""
        randevuSaatTextField.text = ""
        randevuGünTextField.placeholder = "Randevu günü seçiniz..."
        randevuSaatTextField.placeholder = "Randevu saati seçiniz"
    }
    func alertYarat(title:String,message:String){
        
        let alertContoller = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let tamambutton = UIAlertAction(title: "Tamam", style: .cancel)
        
        alertContoller.addAction(tamambutton)
        
        self.present(alertContoller,animated:true)
    }
    
    func bosAlanHatası(){
        alertYarat(title: "Randevu İşlemleri", message: K.bosAlanHata)
    }
    
    func onceGunGirinizHatası(){
        alertYarat(title: "Randevu İşlemleri", message: K.onceGunGiriniz)
    }
    func saatGirinizHatası(){
        alertYarat(title: "Randevu İşlemleri", message: K.saatGiriniz)
    }
    func randevuOnaylandı(){
        alertYarat(title: "Randevu İşlemleri", message: K.randevuBasarili)
    }
  
}




extension ViewControllerKanBagisRandevu{
    
    func randevuSaatPickerYukle(){
        
        randevuSaatTextField.inputView = randevuSaatPicker
    }
    func randevuSaatToolbarYukle(toolbar:UIToolbar){
        
        
        toolbar.tintColor = .black
        toolbar.sizeToFit()
        toolbar.isTranslucent = true
        toolbar.isOpaque = true
        let tamamButton = UIBarButtonItem(title: "Tamam", style: .plain, target: self, action: #selector(self.RandevuSaatTamamMetodu))
        
        let bosluk = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        
        let iptaButton = UIBarButtonItem(title: "İptal", style: .plain, target: nil, action: #selector(RandevuSaatİptalMetodu))
        
        toolbar.setItems([iptaButton,bosluk,tamamButton], animated: true)
        
        randevuSaatTextField.inputAccessoryView = toolbar
    }
    
    @objc func RandevuSaatİptalMetodu(){
        randevuSaatTextField.text = ""
        view.endEditing(true)
    }
    @objc func RandevuSaatTamamMetodu(){

        view.endEditing(true)
    }
    
    
    func randevuGunPickerYukle(){
        
        let date = Date()
        let calendar = Calendar.current
      
        let currentDay = calendar.component(.day, from: date)
        let currentMonth = calendar.component(.month, from: date)
        let currentYear = calendar.component(.year, from: date)
        
        var minDateComponent = calendar.dateComponents([.day,.month,.year], from: Date())
        minDateComponent.day = 0 + currentDay //01
        minDateComponent.month = currentMonth - 00 //01
        minDateComponent.year = currentYear - 00
        let minDate = calendar.date(from: minDateComponent)
        
        print(" min date : \(String(describing: minDate))")

        var maxDateComponent = calendar.dateComponents([.day,.month,.year], from: Date())
        maxDateComponent.day = 15 + currentDay
        maxDateComponent.month =  currentMonth - 00
        maxDateComponent.year = currentYear - 00

        let maxDate = calendar.date(from: maxDateComponent)
        print("max date : \(String(describing: maxDate))")

        randevuGünPicker.minimumDate = minDate! as Date
        randevuGünPicker.maximumDate =  maxDate! as Date
        
        randevuGünPicker.minimumDate = minDate
        randevuGünPicker.maximumDate = maxDate
       
//        if #available(iOS 13.4,*){
//
//            randevuGünPicker.preferredDatePickerStyle = .wheels
//        }
        randevuGünPicker.datePickerMode = .date
        randevuGünTextField.inputView = randevuGünPicker
        
        randevuGünPicker.addTarget(self, action: #selector(self.tarihGoster(dateVeri:)), for: .valueChanged)

        
    }
    
    @objc func tarihGoster(dateVeri:UIDatePicker){
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        let alınanTarihSonHal = dateFormatter.string(from: self.randevuGünPicker.date)
        
        randevuGünTextField.text = alınanTarihSonHal
      
    }
//    func randevuGünToolbarYukle(toolbar:UIToolbar){
//
//
//        toolbar.tintColor = .black
//        toolbar.sizeToFit()
//        toolbar.isTranslucent = true
//        toolbar.isOpaque = true
//        let tamamButton = UIBarButtonItem(title: "Tamam", style: .plain, target: self, action: #selector(self.RandevuGünTamamMetodu))
//
//        let bosluk = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
//
//        let iptaButton = UIBarButtonItem(title: "İptal", style: .plain, target: nil, action: #selector(RandevuGünİptalMetodu))
//
//        toolbar.setItems([iptaButton,bosluk,tamamButton], animated: true)
//
//        randevuGünTextField.inputAccessoryView = toolbar
//    }
//
//    @objc func RandevuGünİptalMetodu(){
//        güncheck = false
//        randevuGünTextField.text = ""
//        view.endEditing(true)
//    }
//    @objc func RandevuGünTamamMetodu(){
//        güncheck = true
//        view.endEditing(true)
//    }
    
    
}

extension ViewControllerKanBagisRandevu:UIPickerViewDelegate,UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        return randevuSaat.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        return randevuSaat[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        self.randevuSaatTextField.text = randevuSaat[row]
    }
    
    
    
}
