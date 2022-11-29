//
//  YasalViewController.swift
//  Kan App
//
//  Created by Hüdahan Altun on 29.11.2022.
//

import UIKit

class YasalViewController: UIViewController {

   
    @IBOutlet weak var okudumAnladimButton: UIButton!
    
    @IBOutlet weak var yasalTableView: UITableView!
    
    @IBOutlet weak var yasalProgressView: UIProgressView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        yasalTableView.delegate = self
        yasalTableView.dataSource = self
        
        yasalProgressView.progress = 0
        
        UIView.animate(withDuration: 2, animations: {
            
            self.yasalProgressView.setProgress(0.3, animated: true)
        })
        
    }
    
    @IBAction func okudumAnladimButtonPressed(_ sender: UIButton) {
        
        self.performSegue(withIdentifier: K.yToKisi, sender: nil)
    }
    

}

extension YasalViewController:UITableViewDelegate,UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier:K.Cell.yCell ,for:indexPath ) as! YasalTableViewCell
        
        cell.yasalLabel.text = ""
        
        return cell
    }
}
