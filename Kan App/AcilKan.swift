//
//  AcilKan.swift
//  Kan App
//
//  Created by Hüdahan Altun on 20.12.2022.
//

import Foundation


class AcilKan{
    
    private var hastaneAd:String?
    private var hastaneLati:Double?
    private var hastaneLongi:Double?
    private var kanGrup:String?
    private var tarih:String?
    init(){
        
        
    }
    
    init(hastaneAd:String,hastaneLati:Double,hastaneLongi:Double,kanGruo:String,tarih:String){
        
        self.hastaneAd = hastaneAd
        self.hastaneLati = hastaneLati
        self.hastaneLongi = hastaneLongi
        self.kanGrup = kanGruo
        self.tarih = tarih
        
    }
    
    
    func getHastaneAd()->String?{
        
        return hastaneAd!
    }
    
    func getHastaneLati()->Double?{
        
        return hastaneLati
    }
    func getHastaneLongi()->Double?{
        return hastaneLongi
    }
    func getKanGrup()->String?{
        
        return kanGrup!
    }
    func getTarih()->String?{
        return tarih!
    }
}
