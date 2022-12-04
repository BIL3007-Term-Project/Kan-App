//
//  SifreYenViewController.swift
//  Kan App
//
//  Created by Hüdahan Altun on 29.11.2022.
//

import UIKit

class SifreYenViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    
    
    @IBOutlet weak var eskiSifreTextField: UITextField!
    
    @IBOutlet weak var yeniSifreTextField: UITextField!
    
    @IBOutlet weak var yeniSifreTkrTextField: UITextField!
    
    @IBOutlet weak var onaylaButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    

    
    @IBAction func onaylaButtonPressed(_ sender: UIButton) {
        
        
    }
    
}



//MARK: - firebase fetch fonksiyonu

extension SifreYenViewController{
    
    func verileriGetir(){
        
        
        //firebaseden gelen verileri
    }
}



//MARK: - güvenlik fonksiyonları

extension SifreYenViewController{
    
    
    
}




//MARK: - textfield protocolleri

extension SifreYenViewController:UITextFieldDelegate{
    
    
    
}
