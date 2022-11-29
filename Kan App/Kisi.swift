//
//  Kisi.swift
//  Kan App
//
//  Created by Hüdahan Altun on 29.11.2022.
//

import Foundation


class Kisi{
    
    private var kisi_ad:String?
    private var kisi_soyad:String?
    private var kisi_tc:Int64?
    private var kisi_dg:Date?
    private var kisi_kilo:Int?
    private var kisi_boy:Int?
    private var cinsiyet:String?
    private var kan_grup:String?
    private var il:String?
    private var ilce:String?
    
    init(kisi_ad:String,kisi_soyad:String,kisi_tc:Int64,kisi_dg:Date,kisi_kilo:Int,kisi_boy:Int,cinsiyet:String?,kan_grup:String,il:String,ilce:String){
        
        
        self.kisi_ad = kisi_ad
        self.kisi_soyad = kisi_soyad
        self.kisi_dg = kisi_dg
        self.kisi_tc = kisi_tc
        self.kisi_kilo = kisi_kilo
        self.kisi_boy = kisi_boy
        self.cinsiyet = cinsiyet
        self.kan_grup = kan_grup
        self.il = il
        self.ilce = ilce
    }
    
    
    
    func getKisi_ad()->String{
        return kisi_ad!
    }
    func getKisi_soyad()->String{
        return kisi_soyad!
    }
    func getKisi_tc()->Int64{
        return kisi_tc!
    }
    func getKisi_dg()->Date{
        return kisi_dg!
    }
    func getKisi_kilo()->Int{
        return kisi_kilo!
    }
    func getKisi_boy()->Int{
        return kisi_boy!
    }
    func get_Cinsiyet()->String{
        return cinsiyet!
    }
    func getKan_grup()->String{
        return kan_grup!
    }
    func get_il()->String{
        return il!
    }
    func get_ilce()->String{
        return ilce!
    }
    
    
    func serKisi_ad(kisi_ad:String){
        
        self.kisi_ad = kisi_ad
    }
    func setKisi_soyad(kisi_soyad:String){
        self.kisi_soyad = kisi_soyad
    }
    func setKisi_tc(kisi_tc:Int64){
        self.kisi_tc = kisi_tc
    }
    func setKisi_dg(kisi_dg:Date){
        self.kisi_dg = kisi_dg
    }
    func setKisi_kilo(kisi_kilo:Int){
        self.kisi_kilo = kisi_kilo
    }
    func setKisi_boy(kisi_boy:Int){
        self.kisi_boy = kisi_boy
    }
    func set_Cinsiyet(cinsiyet:String){
        self.cinsiyet = cinsiyet
    }
    func setKan_grup(kan_grup:String){
        self.kan_grup = kan_grup
    }
    func set_il(il:String){
        self.il = il
    }
    func set_ilce(ilce:String){
        self.ilce = ilce
    }
    
}
