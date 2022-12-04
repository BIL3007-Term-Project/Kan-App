//
//  GizlilikViewController.swift
//  Kan App
//
//  Created by Hüdahan Altun on 1.12.2022.
//

import UIKit

class GizlilikViewController: UIViewController {

    @IBOutlet weak var gizlilikLabel: UILabel!
    
    @IBOutlet weak var gizlilikTextView: UITextView!
    
    @IBOutlet weak var gizlilikButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func gizlilikButtonPressed(_ sender: Any) {
        self.dismiss(animated: true,completion: nil)
    }
    
}
