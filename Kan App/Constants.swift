//
//  Constants.swift
//  Kan App
//
//  Created by Hüdahan Altun on 29.11.2022.
//

import Foundation


struct K{
    
    //segue identifier
    static let gToSifre:String = "girisToSifreYen"
    static let gToYasal:String = "girisToYasal"
    static let yToKisi:String = "yasalToKisisel"
    static let kToKayit:String = "kisiseltoKayit"
    static let kToMain:String = "kayitToMain"
    static let gToMain:String = "girisToMain"
    static let bToKan:String = "bagisToKan"
    static let bToKok:String = "bagisToKok"
    static let bToImmun:String = "bagisToImmune"
    static let bToAferez:String = "bagisToAferez"
    
    
    
    //kayitVC güvenlik check
    static let hesapGuv:String = "Mail adresiniz \"@gmail.com\" uzantılı olmalıdır.\nŞifreniz 8-15 karakter aralığında olmalıdır.Ayrıca sifreniz en az bir büyük harf, küçük harf, sayı ve .,$@$#!%*?& içermelidir"
    
    static let guvHata:String = "Lütfen hesap bilgilerinizi kontrol ediniz.Gereksinimler için soru işaretine tıklayabilirsiniz."
    
    static let bosAlanHata:String = "Boş alan bırakılamaz!"
    static let gmailCheck:[Substring.Element] = ["@", "g", "m", "a", "i", "l", ".", "c", "o", "m"]
    
    
    //yasalVC için Yasal Uyarı,KKVC için kullanım kosulları,gizlilikVC için gizlilik koşulları.
    
    static let yasalUyari:String = ""
    static let kullanimKosullari:String = ""
    static let gizlilikKosullari:String = ""
   
}
