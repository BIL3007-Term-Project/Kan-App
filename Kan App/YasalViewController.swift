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
    
    
    var yasalİcerik:String = "Bilindiği üzere Anayasanın 128 inci maddesi; “Devletin, kamu iktisadi teşebbüsleri ve diğer kamu tüzelkişilerinin genel idare esaslarına göre yürütmekle yükümlü oldukları kamu hizmetlerinin gerektirdiği asli ve sürekli görevler, memurlar ve diğer kamu görevlileri eliyle görülür. Memurların ve diğer kamu görevlilerinin nitelikleri, atanmaları, görev ve yetkileri, hakları ve yükümlülükleri, aylık ve ödenekleri ve diğer özlük işleri kanunla düzenlenir. Ancak, malî ve sosyal haklara ilişkin toplu sözleşme hükümleri saklıdır.” hükmünü, 129 uncu maddesi ise; “Memurlar ve diğer kamu görevlileri Anayasa ve kanunlara sadık kalarak faaliyette bulunmakla yükümlüdürler.” hükmünü amirdir. Anılan Anayasa maddeleri, kamu hizmetlerinin Devlet memurları ve diğer kamu görevlileri eliyle yürütüleceğini, memurların bu görevleri yürütürken Anayasa ve kanunlara sadık kalma zorunluluğunu haiz olduğunu ve memurlara ilişkin haklar ve yükümlülüklerin kanunla düzenleneceğini açıkça hükme bağlamıştır. Konuya ilişkin ayrıntılı düzenlemelere ise 657 sayılı Devlet Memurları Kanununda yer verilmiştir.657 sayılı Kanunun “Kapsam” başlıklı 1 inci maddesine göre, bu Kanunun kapsamına; Genel ve Katma Bütçeli Kurumlar, İl Özel İdareleri, Belediyeler, İl Özel İdareleri ve Belediyelerin kurdukları birlikler ile bunlara bağlı döner sermayeli kuruluşlarda, kanunlarla kurulan fonlarda, kefalet sandıklarında veya Beden Terbiyesi Bölge Müdürlüklerinde çalışan memurlar girmektedir. Sözleşmeli ve geçici personel için ise, 657 sayılı Kanunda belirtilen özel hükümler uygulanacaktır. 657 sayılı Kanunun 2 nci maddesi gereğince, bu Kanunun amacı; Devlet memurlarının hizmet şartlarını, niteliklerini, atanma ve yetiştirilmelerini, ilerleme ve yükselmelerini, ödev, hak, yüküm ve sorumluluklarını, aylıklarını ve ödeneklerini ve diğer özlük işlerini düzenlemektir. 657 sayılı Kanunun “Ödevler ve Sorumluluklar” başlıklı İkinci Bölümünde, Devlet memurlarına ilişkin oldukça ayrıntılı düzenlemelere yer verilmiştir. Bu Kanunun 6 ncı maddesi; “Devlet memurları, Türkiye Cumhuriyeti Anayasasına ve kanunlarına sadakatla bağlı kalmak ve milletin hizmetinde Türkiye Cumhuriyeti kanunlarını sadakatla uygulamak zorundadırlar. Devlet memurları bu hususu  atandıktan sonra en geç bir ay içinde kurumlarınca düzenlenecek merasimle yetkili amirlerin huzurunda yapacakları yeminle belirtirler ve özlük dosyalarına konulacak aşağıdaki  imzalayarak göreve başlarlar.” hükmünü; 11 inci maddesi; “Devlet memurları kanun ve diğer mevzuatta belirtilen esaslara uymakla ve "
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        yasalTableView.delegate = self
        yasalTableView.dataSource = self
        
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
        
        cell.yasalLabel.text = yasalİcerik
        
        return cell
    }
}
