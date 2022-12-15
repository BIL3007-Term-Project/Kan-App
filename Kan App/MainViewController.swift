//
//  MainViewController.swift
//  Kan App
//
//  Created by Hüdahan Altun on 29.11.2022.
//

import UIKit

class MainViewController: UIViewController {

    
    @IBOutlet weak var yasIconIV: UIImageView!
    
    @IBOutlet weak var boyIconIv: UIImageView!
    
    @IBOutlet weak var kiloIconIV: UIImageView!
    
    @IBOutlet weak var kanIconIV: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tabBarController?.navigationItem.hidesBackButton = true
        
        yasIconIV.layer.cornerRadius = yasIconIV.frame.height/5
        boyIconIv.layer.cornerRadius = boyIconIv.frame.height/5
        kiloIconIV.layer.cornerRadius = kiloIconIV.frame.height/5
        kanIconIV.layer.cornerRadius = kanIconIV.frame.height/5
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
