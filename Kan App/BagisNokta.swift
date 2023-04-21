//
//  BagisNokta.swift
//  Kan App
//
//  Created by Hüdahan Altun on 18.12.2022.
//

import Foundation


class BagisNokta{
    
    private var id:Int?
    private var b_name:String?
    private var b_lati:Double?
    private var b_longi:Double?
    private var b_image:String?
    private var b_il:String?
    private var b_ilce:String?
    private var b_yer:String?
    
    init(){
        
    }
    
    init(id:Int,b_name:String,b_lati:Double,b_longi:Double,b_image:String,b_il:String,b_ilce:String,b_yer:String){
        
        self.id = id
        self.b_name = b_name
        self.b_lati = b_lati
        self.b_longi = b_longi
        self.b_image = b_image
        self.b_il = b_il
        self.b_ilce = b_ilce
        self.b_yer = b_yer
    }
    
    func getbagisID()->Int{
        
        return id!
    }
    
    func getBagisAd()->String{
        
        return b_name!
    }
    func getBagisLati()->Double{
        
        return b_lati!
    }
    func getBagisLongi()->Double{
        
        return b_longi!
    }
    func getBagisImage()->String{
        
        return b_image!
    }
    func getBagisIl()->String{
        
        return b_il!
    }
    func getBagisIlce()->String{
        
        return b_ilce!
    }
    func getBagisTip()->String{
        
        return b_yer!
    }
}
