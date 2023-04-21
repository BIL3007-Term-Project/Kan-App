//
//  ViewControllerKanBagis.swift
//  Kan App
//
//  Created by Hüdahan Altun on 7.12.2022.
//

import UIKit

class ViewControllerKanBagis: UIViewController {

    @IBOutlet weak var kanBagisTableView: UITableView!
    

    let screenWidthG = UIScreen.main.bounds.width
    let screenHeightG = UIScreen.main.bounds.height
    var gelenBagisMerkezleri:[BagisNokta] = [BagisNokta] ()
    
    var secilenNoktaID:Int?
    //Trabzon Ortahisar konumları @40.9930417,39.6488585,12z
    
    //Ad : Türk Kızılay - Trabzon Şubesi - tel:+90 (462) 202 00 11 n enlem : 41.00510601 boylam : 39.71432916
//hareketli notkalar :
    // 41.005539,39.7300817,16.38z meydan parkı
    // 40.993358, 39.775804  ktü bilg müh fak önü
    // 40.999101, 39.768048  ktü ydyo önü
    //
    //
    //
    //
    //hudahanaltun@gmail.com

    override func viewDidLoad() {
        super.viewDidLoad()

        kanBagisTableView.delegate = self
        kanBagisTableView.dataSource = self
        kanBagisTableView.separatorStyle = .singleLine
        kanBagisTableView.separatorColor = .red
        gelenBagisMerkezleri = BagisNoktaDAO().tümNoktalariAl()
        
        kanBagisTableView.backgroundColor = UIColor(rgb: 0xFFE1E1)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let gelenid = sender as? Int{
            
            let gidilecekDetayVC = segue.destination as? ViewControllerKanBagisDetay
            
            gidilecekDetayVC?.noktaID = gelenid
            
        }
    }


}


extension ViewControllerKanBagis:UITableViewDelegate,UITableViewDataSource{

    func numberOfSections(in tableView: UITableView) -> Int {

        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return gelenBagisMerkezleri.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {


        let cell = tableView.dequeueReusableCell(withIdentifier: "bagisCell", for:indexPath) as! TableViewCellBagis
        
        cell.layer.transform = CATransform3DMakeScale(0.1,0.1,1)
        UIView.animate(withDuration: 0.5, animations: {
            cell.layer.transform = CATransform3DMakeScale(1.05,1.05,1)
            },completion: { finished in
                UIView.animate(withDuration: 0.3, animations: {
                    cell.layer.transform = CATransform3DMakeScale(1,1,1)
                })
        })
                
        cell.bagisYerLabel.text = gelenBagisMerkezleri[indexPath.row].getBagisAd()
        cell.bagisYerImageView.image = UIImage(named: gelenBagisMerkezleri[indexPath.row].getBagisTip())
        cell.frame.size = CGSize(width: screenHeightG/8, height: screenHeightG/8)
        cell.selectionStyle = .none
        cell.backgroundColor = UIColor(rgb: 0xFFE1E1)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        print("\(gelenBagisMerkezleri[indexPath.row].getBagisAd())secildi")
        
        secilenNoktaID = gelenBagisMerkezleri[indexPath.row].getbagisID()
        
        performSegue(withIdentifier: K.bToDetay, sender: secilenNoktaID)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        //TV cell boyutunu cihazın yatay ve dikey konumuna göre ayarladık.
        let screenWidth = UIScreen.main.bounds.width
        let screenHeight = UIScreen.main.bounds.height
        
        var rowHeight:CGFloat = screenHeight/5
        let currentDevice = UIDevice.current

        if currentDevice.orientation.isPortrait {
            // Dikey modda
            rowHeight = screenHeight/8
        } else if currentDevice.orientation.isLandscape {
            // Yatay modda
            rowHeight = screenWidth/8
        }
        
        return rowHeight
    }
   
   
}
