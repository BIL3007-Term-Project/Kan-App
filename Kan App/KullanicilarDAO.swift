//
//  KullanicilarDAO.swift
//  Kan App
//
//  Created by Hüdahan Altun on 14.12.2022.
//

import Foundation


class kullanicilarDAO{
    
    var db:FMDatabase?
    
    init(){
        
        
        let hedefYol = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        
        let veritabanıURL = URL(filePath: hedefYol).appending(path: "bagiscilar.sqlite")
        
        
        db = FMDatabase(path: veritabanıURL.path)
    }
    
    
    
    
    func mobilKullaniciEkle(k_mail:String,k_sifre:String,k_ad:String,k_soyad:String,k_tc:String,k_tel:String,k_dogumgunu:Date,k_kilo:Int,k_boy:Int,k_cinsiyet:String,k_kangrup:String)->Bool{
        
        db?.open()
        
        
        do{
            
            try db!.executeUpdate("INSERT INTO  Kullanicilar(k_mail,k_sifre,k_ad,k_soyad,k_tc,k_tel,k_dogumgunu,k_kilo,k_boy,k_cinsiyet,k_kangrup) VALUES(?,?,?,?,?,?,?,?,?,?,?)", values: [k_mail,k_sifre,k_ad,k_soyad,k_tc,k_tel,k_dogumgunu,k_kilo,k_boy,k_cinsiyet,k_kangrup])
            
            print(" Mobil kullanici eklemek başarılı!")

            db!.close()
            return true
            
        }catch{
            
            print("mobil kullanici eklemek başarısız!")
            
            db!.close()
            return false
            
        }
    
        
        
    }
    
    
    
    func MobilKullaniciGetir(k_mail:String)->mobilKullanicilar{//anaVC doğrulama ve diğer doğrulamalar için
        
        var gelenMobilKullanici:mobilKullanicilar = mobilKullanicilar()
        
        db?.open()
        
        do{
            
            
            let rs = try db!.executeQuery("SELECT * FROM Kullanicilar WHERE k_mail = ?", values: [k_mail])
            
            while(rs.next()){
                
                let mobilKTemp = mobilKullanicilar(k_mail: rs.string(forColumn: "k_mail")!, k_sifre: rs.string(forColumn: "k_sifre")!, k_ad: rs.string(forColumn: "k_ad")!, k_soyad: rs.string(forColumn: "k_soyad")!, k_tc: rs.string(forColumn: "k_tc")!, k_tel: rs.string(forColumn: "k_tel")!, k_dogumgunu: rs.string(forColumn: "k_dogumgunu")!, k_kilo: Int(rs.string(forColumn: "k_kilo"))!, k_boy: Int(rs.string(forColumn: "k_boy"))!, k_cinsiyet: rs.string(forColumn: "k_cinsiyet")!, k_kangrup: rs.string(forColumn: "k_kangrup")!)
               
                gelenMobilKullanici = mobilKTemp
                
            }
            
            print("KullanicilarDAO  mobilKullanici getirme başarılı!")
        }catch{
            
            print("kullanicilarDao mobilKullanici  getirme BAŞARISIZZ!")
        }
        
        db?.close()
        
        return gelenMobilKullanici
    }
//    
//    func OrtakDonorEkle(donor_name:String)->Bool{
//        //donor ekleme
//        db?.open()
//
//
//        do{
//
//            try db!.executeUpdate("INSERT INTO  app_donor(donor_name) VALUES(?)", values: [donor_name])
//
//            print("OrtakDonor kisi kayıt başarılı!")
//
//            db!.close()
//            return true
//        }catch{
//
//            print("OrtakDonor kisi kayıt başarısız!")
//            db!.close()
//            return false
//
//        }
//
//
//    }
}
