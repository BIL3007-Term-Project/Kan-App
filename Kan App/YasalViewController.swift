//
//  YasalViewController.swift
//  Kan App
//
//  Created by Hüdahan Altun on 29.11.2022.
//

import UIKit

class YasalViewController: UIViewController {

   
    @IBOutlet weak var okudumAnladimButton: UIButton!
    
    
    @IBOutlet weak var yasalProgressView: UIProgressView!
    
    @IBOutlet weak var yasalUyarıTextView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()

        yasalUyarıTextView.isEditable = false // textView düzenlemesi yasaklandı.
        
        yasalProgressView.progress = 0
        
        UIView.animate(withDuration: 2, animations: {
            
            self.yasalProgressView.setProgress(0.3, animated: true)
        })
        
    }
    
    @IBAction func okudumAnladimButtonPressed(_ sender: UIButton) {
        
        self.performSegue(withIdentifier: K.yToKisi, sender: nil)
    }
    

}
