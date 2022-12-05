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
    
    //MARK: - iOS döngü fonksiyonları
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
   
        
        bilgiLabel.alpha = 0
        kayıtButton.alpha = 0
        
        emailTextField.alpha = 1
        sifreTextField.alpha = 1
        girisButton.alpha = 1
        
        emailTextField.keyboardType = .default
        emailTextField.autocorrectionType = .no
        emailTextField.autocapitalizationType = .none
        
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
        
        self.performSegue(withIdentifier:K.gToMain, sender: nil)
    }
    
    
    @IBAction func kayıtButtonPressed(_ sender: UIButton) {
        
        self.performSegue(withIdentifier: K.gToYasal, sender: nil)
    }
    
    
    @IBAction func sifreUnButtonPressed(_ sender: UIBarButtonItem) {
        
        self.performSegue(withIdentifier: K.gToSifre, sender: nil)
    }
    
    
    //MARK: - extra fonksiyonlar
    
    
    func runNameAnimation(){
        
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

