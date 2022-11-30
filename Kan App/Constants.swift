//
//  Constants.swift
//  Kan App
//
//  Created by Hüdahan Altun on 29.11.2022.
//

import Foundation


struct K{
    
    static let gToSifre:String = "girisToSifreYen"
    static let gToYasal:String = "girisToYasal"
    static let yToKisi:String = "yasalToKisisel"
    static let kToKayit:String = "kisiseltoKayit"
    static let kToMain:String = "kayitToMain"
    static let gToMain:String = "girisToMain"
    
    
    struct Cell{
        
        static let yCell:String = "yasalCell"
        
    }
    
    static let hesapGuv:String = "Mail adresiniz \"@gmail\" olmalıdır.\nŞifreniz en az 8 karakter olmalıdır ayrıca en az bir büyük harf, küçük harf, sayı ve .,$@$#!%*?& içermelidir"
    
    static let guvHata:String = "Lütfen hesap bilgilerinizi kontrol ediniz.Gereksinimler için soru işaretine tıklayabilirsiniz."
    
    static let bosAlanHata:String = "Boş alan bırakılamaz!"
    static let gmailCheck:[Substring.Element] = ["@", "g", "m", "a", "i", "l", ".", "c", "o", "m"]
}
