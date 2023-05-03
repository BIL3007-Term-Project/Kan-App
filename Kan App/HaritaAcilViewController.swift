//
//  HaritaAcilViewController.swift
//  Kan App
//
//  Created by Hüdahan Altun on 5.12.2022.
//

import UIKit
import MapKit
import FirebaseCore
import FirebaseFirestore

class HaritaAcilViewController: UIViewController {

    var locationManagerAcil = CLLocationManager()//lokasyon verileri almak için kullanacağımız nesne
    var bildirimIzinKontrol:Bool = false
    
    let firestoreDB = Firestore.firestore()
    
    @IBOutlet weak var acilKanTableView: UITableView!
    
    var acilKanListesi:[AcilKan] = [AcilKan] ()
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        acilKanListesi.removeAll()
        
        UNUserNotificationCenter.current().requestAuthorization(options : [.alert,.sound,.badge]) {
            (granted, error) in
            
            
            self.bildirimIzinKontrol = granted
            
            if granted{
                print("bildirim izni verildi")
            }else{
                
                print("bildirim izni verilmedi")
            }
            
        }
        
        UNUserNotificationCenter.current().delegate = self
        
      
        
        acilKanTableView.delegate = self
        acilKanTableView.dataSource = self
     
        acilKanTableView.backgroundColor = UIColor(rgb: 0xFFE1E1)
         
//        acilKanRealtime()
//        acilKanYukle()
    }
    
    

    func acilBildiriBilgilendirme(){
        
        let mesaj = "\(acilKanListesi[acilKanListesi.count-1].getHastaneAd()!)'inde acil \(acilKanListesi[acilKanListesi.count-1].getKanGrup()!) kan grubuna ihtiyaç vardır "
        
        let alertController = UIAlertController(title: "Acil Kan İhtiyacı", message: mesaj, preferredStyle: .alert)
        
        let tamamButton = UIAlertAction(title: "Tamam", style: .cancel)
        
        alertController.addAction(tamamButton)
        
        self.present(alertController, animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {

//        acilKanYukle()
        acilKanRealtime()

        print("------------------")
//        acilKanListesiYazdir()

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == K.ha1Toha2{
            
            if let acilNokta = sender as? AcilKan{
                
             
                let gidilecekVC = segue.destination as! HaritaAcil2ViewController
                gidilecekVC.gelenAcilNokta = acilNokta
                
            }
        }
       
    }
  
    
    func acilKanListesiYazdir(){
        
        for i in acilKanListesi{
            
            print(i.getHastaneAd()!)
            print(i.getHastaneLati()!)
            print(i.getHastaneLongi()!)
            print(i.getKanGrup()!)
        }
    }
    
    func acilBildirimOlustur(hastaneAd:String,kanGrup:String){
        
        if bildirimIzinKontrol{
            
            let bildirimIcerik = UNMutableNotificationContent()
            
            bildirimIcerik.title = "Acil Kan ihtiyacı mevcut"
//            bildirimIcerik.subtitle = "alt baslik"
            bildirimIcerik.body = "\(hastaneAd)'nde  acil \(kanGrup) ihtiyacı vardır"
            bildirimIcerik.badge = 1
            bildirimIcerik.sound = .default
            
            let kabul = UNNotificationAction(identifier: "Görüntüle", title: "Görüntüle",options:.foreground)
            let red = UNNotificationAction(identifier: "Sil", title: "Sil",options:.destructive)
            
            let kategori = UNNotificationCategory(identifier: "kategori", actions: [kabul,red], intentIdentifiers: [],options:[])
            
            UNUserNotificationCenter.current().setNotificationCategories([kategori])
            bildirimIcerik.categoryIdentifier = "kategori"
            
            let bildirimTetikle = UNTimeIntervalNotificationTrigger(timeInterval: 1, repeats: false)
            let bildirimIste =  UNNotificationRequest(identifier: "acil istek", content: bildirimIcerik, trigger: bildirimTetikle)
            
            UNUserNotificationCenter.current().add(bildirimIste)
            
        }
        
    }
    func acilKanRealtime(){//realtime olarak db her değişince bu fonk çalışır.

        print("acil realtime calısıyor")
        
        firestoreDB.collection("Acil").order(by: "timestamp").addSnapshotListener() {

            (QuerySnapshot,error) in
            
            self.acilKanListesi.removeAll()
            if let e = error{

                print("acil kan verisi getirme başarısız!.hata kodu :\(e)")
            }else{

                print("veri getirme başarılı")

                if let snapShotDoc = QuerySnapshot?.documents{

                    for doc in snapShotDoc{

                        let data = doc.data()
                        //firestoreDB.collection("Acil").addDocument(data: ["Hastane_ad":hAd,"latitude":lati,"longitude":longi,"kan":kan])
                        if let hastaneAd = data["Hastane_ad"] as? String, let hastaneLati = data["latitude"] as? String, let hastaneLongi = data["longitude"] as? String,let kanGrup = data["kan"] as? String,let tarih = data["timestamp"] as? Timestamp{

                            let dateFormatter = DateFormatter()
                            dateFormatter.dateFormat = "dd.MM.yyyy HH:mm:ss"
                            let dateString = dateFormatter.string(from: tarih.dateValue())
                            
//
                            let acilKan = AcilKan(hastaneAd: hastaneAd, hastaneLati: Double(hastaneLati)!, hastaneLongi: Double(hastaneLongi)!, kanGruo: kanGrup,tarih:dateString)

                            self.acilKanListesi.append(acilKan)

                            DispatchQueue.main.async {
                                
                                self.acilKanTableView.reloadData()
                                self.acilBildirimOlustur(hastaneAd: acilKan.getHastaneAd()!, kanGrup: acilKan.getKanGrup()!)
                            }
                            
                        }else{

                            print("nesne eşleştirme başarısız")
                        }
                    }
                    
                    
                }else{
                    print("doc getirme başarısız")
                }

            }
        }
        self.acilKanListesiYazdir()

    }

//    func acilKanYukle(){//birkez
//
//        print("acil kan yukle calısıyor")
//        firestoreDB.collection("Acil").getDocuments() {
//
//            (QuerySnapshot,error) in
//
//            self.acilKanListesi.removeAll()
//
//            if let e = error{
//
//                print("acil kan verisi getirme başarısız!.hata kodu :\(e)")
//            }else{
//
//                print("veri getirme başarılı")
//
//                if let snapShotDoc = QuerySnapshot?.documents{
//
//                    for doc in snapShotDoc{
//
//                        let data = doc.data()
//                        //firestoreDB.collection("Acil").addDocument(data: ["Hastane_ad":hAd,"latitude":lati,"longitude":longi,"kan":kan])
//                        if let hastaneAd = data["Hastane_ad"] as? String, let hastaneLati = data["latitude"] as? String, let hastaneLongi = data["longitude"] as? String,let kanGrup = data["kan"] as? String{
//
//                            let acilKan = AcilKan(hastaneAd: hastaneAd, hastaneLati: Double(hastaneLati)!, hastaneLongi: Double(hastaneLongi)!, kanGruo: kanGrup)
//
//
//                            self.acilKanListesi.append(acilKan)
//
//                            DispatchQueue.main.async {
//
//                                self.acilKanTableView.reloadData()
//                                self.acilKanListesiYazdir()
//                            }
//                        }else{
//
//                            print("nesne eşleştirme başarısız")
//                        }
//                    }
//                }else{
//                    print("doc getirme başarısız")
//                }
//
//            }
//        }
//
//    }

    
   
}

//MARK: - tableview protocols

extension HaritaAcilViewController:UITableViewDelegate,UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return acilKanListesi.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "acilCell",for:indexPath) as! TableViewCellAcil
        
        cell.acilLabel.text = "\(indexPath.row + 1)- \(String(describing: acilKanListesi[indexPath.row].getHastaneAd()!)): \(String(describing: acilKanListesi[indexPath.row].getKanGrup()!))"
       mesafeAl(lati: acilKanListesi[indexPath.row].getHastaneLati()!,
                              longi: acilKanListesi[indexPath.row].getHastaneLongi()!, completion: { mesafe in
           cell.mesafeLabel.text = "Mesafe: \(mesafe!) km"
           
        })
        
        cell.tarihLabel.text = "Oluşturulma Tarihi: \(acilKanListesi[indexPath.row].getTarih()!)"
        
        
        cell.layer.transform = CATransform3DMakeScale(0.1,0.1,1)
        UIView.animate(withDuration: 0.5, animations: {
            cell.layer.transform = CATransform3DMakeScale(1.05,1.05,1)
            },completion: { finished in
                UIView.animate(withDuration: 0.3, animations: {
                    cell.layer.transform = CATransform3DMakeScale(1,1,1)
                })
        })
        
        cell.selectionStyle = .none
        cell.backgroundColor = UIColor(rgb: 0xFFE1E1)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        print("\(acilKanListesi[indexPath.row].getHastaneAd()) secildi")
        
        performSegue(withIdentifier: K.ha1Toha2, sender: acilKanListesi[indexPath.row])
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        //TV cell boyutunu cihazın yatay ve dikey konumuna göre ayarladık.
        let screenWidth = UIScreen.main.bounds.width
        let screenHeight = UIScreen.main.bounds.height
        
        var rowHeight:CGFloat = screenHeight/6
        let currentDevice = UIDevice.current

        if currentDevice.orientation.isPortrait {
            // Dikey modda
            rowHeight = screenHeight/6
        } else if currentDevice.orientation.isLandscape {
            // Yatay modda
            rowHeight = screenWidth/6
        }
        
        return rowHeight
    }
    
}

//MARK: - usernotification center
extension HaritaAcilViewController:UNUserNotificationCenterDelegate{
    
    //arkaplanda bildiirm çalışması
    func  userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        
        completionHandler([.banner,.sound,.badge])
    }
    
    // butonlara tıklanınca ne olacak metodu
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        
        
        if response.actionIdentifier == "Görüntüle"{
            
          acilBildiriBilgilendirme()
        }
        else if response.actionIdentifier == "Sil"{
            
            print("hayır tıklanıd")
            
            view.endEditing(true)
        }else{
            
            acilBildiriBilgilendirme()
        }
        
        completionHandler()
            
    }
}


extension HaritaAcilViewController{
    func mesafeAl(lati:Double,longi:Double, completion: @escaping (Double?) -> Void) {
        if let currentLocation = locationManagerAcil.location {
            let sourceLocation = currentLocation.coordinate
            let destinationLocation = CLLocationCoordinate2D(latitude: lati, longitude: longi)

            let sourcePlacemark = MKPlacemark(coordinate: sourceLocation)
            let destinationPlacemark = MKPlacemark(coordinate: destinationLocation)

            let directionRequest = MKDirections.Request()
            directionRequest.source = MKMapItem(placemark: sourcePlacemark)
            directionRequest.destination = MKMapItem(placemark: destinationPlacemark)
            directionRequest.transportType = .automobile

            let directions = MKDirections(request: directionRequest)
            directions.calculate { (response, error) in
                guard let response = response else {
                    if let error = error {
                        print("Bir hata oluştu: \(error.localizedDescription)")
                        completion(nil)
                    }
                    return
                }

                let route = response.routes[0]
                let distanceInMeters = route.distance
                let distanceInKilometers = distanceInMeters / 1000.0
                print("MMESAFE: \(distanceInKilometers) km")
                completion(distanceInKilometers)
            }
        } else {
            completion(nil)
        }
    }

}
