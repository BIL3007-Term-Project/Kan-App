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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dgPickerYukle()
        
        
        
        
        let dokunmaAlgılama = UITapGestureRecognizer(target: self, action: #selector(self.dokunmaAlgılamaMetodu))
        
        view.addGestureRecognizer(dokunmaAlgılama)
        
    }
    

    @IBAction func ileriKButtonPressed(_ sender: UIButton) {
        
        self.performSegue(withIdentifier: K.kToKayit, sender: nil)
    }
    

}

// MARK: - textfield protocolleri

extension KisiselViewController:UITextFieldDelegate{
    
    
    
}

//MARK: - Picker Fonksiyonları ve Ojective-C temelli fonksiyonlar


extension KisiselViewController{
    
    func dgPickerYukle(){
        
        dgDatePicker.datePickerMode = .date
        dogumTextField.inputView = dgDatePicker
        
        dgDatePicker.addTarget(self, action: #selector(self.tarihGoster(dateVeri:)), for: .valueChanged)

    }
    
    @objc func tarihGoster(dateVeri:UIDatePicker){
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        let alınanTarihSonHal = dateFormatter.string(from: self.dgDatePicker.date)
        
        dogumTextField.text = alınanTarihSonHal
    }
    
}



//MARK: - Dokunma Algılama Fonksiyonu

extension KisiselViewController{
    
    @objc func dokunmaAlgılamaMetodu(){
        
        view.endEditing(true)
    }
}

//MARK: - Picker Protocolleri





