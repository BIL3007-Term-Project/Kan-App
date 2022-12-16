//
//  ViewControllerKanBagis.swift
//  Kan App
//
//  Created by Hüdahan Altun on 7.12.2022.
//

import UIKit

class ViewControllerKanBagis: UIViewController {

    @IBOutlet weak var kanBagisTableView: UITableView!
    

    var gelenBagisMerkezleri:[String]?
    //Trabzon Ortahisar konumları @40.9930417,39.6488585,12z
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        kanBagisTableView.delegate = self
        kanBagisTableView.dataSource = self
        
    }
    


}


extension ViewControllerKanBagis:UITableViewDelegate,UITableViewDataSource{

    func numberOfSections(in tableView: UITableView) -> Int {

        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return gelenBagisMerkezleri!.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {


        let cell = tableView.dequeueReusableCell(withIdentifier: "lfa",for:indexPath)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
    }
}
