//
//  Constants.swift
//  Kan App
//
//  Created by Hüdahan Altun on 29.11.2022.
//

import Foundation


struct K{
    
    //segue identifier
    static let gToSifreUnut:String = "girisToSifreUnut"
    static let gToYasal:String = "girisToYasal"
    static let yToKisi:String = "yasalToKisisel"
    static let kToKayit:String = "kisiseltoKayit"
    static let kToMain:String = "kayitToMain"
    static let gToMain:String = "girisToMain"
    static let bToKan:String = "bagisToKan"
    static let bToKok:String = "bagisToKok"
    static let bToImmun:String = "bagisToImmune"
    static let bToAferez:String = "bagisToAferez"
    static let bToDetay:String = "kanBagisToDetay"
    static let hToHDetay:String = "haritaToHaritaDetay"
    static let mToAyar:String = "mainToAyarlar"
    static let aToSifYen:String = "ayarlarToSifYen"
    
    
    //kayitVC güvenlik check
    static let hesapGuv:String = "Mail adresiniz \"@gmail.com\" uzantılı olmalıdır.\nŞifreniz 8-15 karakter aralığında olmalıdır.Ayrıca sifreniz en az bir büyük harf, küçük harf, sayı ve .,$@$#!%*?& içermelidir"
    
    static let guvHata:String = "Lütfen hesap bilgilerinizi kontrol ediniz.Gereksinimler için soru işaretine tıklayabilirsiniz."
    
    static let hesapOlusturma:String = "Girilen mail adresiyle kayıtlı başka bir kullanıcı mevcut.Lütfen farklı mail adresi deneyiniz."
    static let bosAlanHata:String = "Boş alan bırakılamaz!"
    static let gmailCheck:[Substring.Element] = ["@", "g", "m", "a", "i", "l", ".", "c", "o", "m"]
    
    static let bilgYanlis:String = "Girdiğiniz bilgiler yanlış lütfen tekrar deneyiniz."
    
    static let mevcutSifreYanlis:String = "Mevcut şifreniz yanlış"
    static let sifreEslesmiyor:String = "Girilen şifreler eşleşmiyor"
    static let sifreDeBasarili:String = "Şifreniz başarıyla değiştirildi."
    static let sifreGuv:String = "Şifreniz 8-15 karakter aralığında olmalıdır.Ayrıca sifreniz en az bir büyük harf, küçük harf, sayı ve .,$@$#!%*?& içermelidir"
    //yasalVC için Yasal Uyarı,KKVC için kullanım kosulları,gizlilikVC için gizlilik koşulları.
    
    static let yasalUyari:String = ""
    static let kullanimKosullari:String = ""
    static let gizlilikKosullari:String = ""
   
}
