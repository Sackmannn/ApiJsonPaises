//
//  InformacionViewController.swift
//  NewsapiProject
//
//  Created by user on 22/4/21.
//

import UIKit
//import SeeMoreTextView

extension String {
    // formatting text for currency textField
    func currencyFormatting() -> String {
        if let value = Double(self) {
            let formatter = NumberFormatter()
            formatter.numberStyle = .decimal
            formatter.maximumFractionDigits = 0
            formatter.minimumFractionDigits = 0
            if let str = formatter.string(for: value) {
                return str
            }
        }
        return ""
    }
}

class InformacionViewController: UIViewController {

    @IBOutlet weak var textoTxtPrueb: UITextView!
    
    var infoBasica : Countries!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mostrarInfo()
    }
    
    func mostrarInfo(){
        var infoDomain : String = ""
        var infoCallingCodes : String = ""
        var infoAltSpellings : String = ""
        var infoTimeZones : String = ""
        var infoBorders : String = ""
        var currencies : Currency!

        for h in infoBasica.currencies{
            currencies = h
        }
        
        let infoTranslation : [String?] = ["Portuguese: " + infoBasica.translations.br, "Germany: " + infoBasica.translations.de!, "Spanish: " + infoBasica.translations.es!, "Persian: " + infoBasica.translations.fa,"France: " + infoBasica.translations.fr!,"Italian: " + infoBasica.translations.it!,"Japanese:" + infoBasica.translations.ja!]
    
        var infoTranslation2 : String = ""
        
        for g in infoTranslation{
            infoTranslation2 =  infoTranslation2 + g! + "\n" + "\n"
        }
        for b in infoBasica.topLevelDomain{
            if infoBasica.topLevelDomain.count < 2 {
                infoDomain = infoDomain + b + "  "
            }else{
                infoDomain = infoDomain + b + " ; "
            }
        }
        
        for c in infoBasica.callingCodes{
            if infoBasica.timezones.count < 2{
                infoCallingCodes =  infoCallingCodes + c + "  "
            }else {
                infoCallingCodes =  infoCallingCodes + c + " ; "
            }
        }
        for d in infoBasica.altSpellings{
            if infoBasica.altSpellings.count < 2 {
                infoAltSpellings = infoAltSpellings + d + "  "
            }else{
                infoAltSpellings = infoAltSpellings + d + " ; "
            }
        }
        for e in infoBasica.timezones{
            if infoBasica.timezones.count < 2{
                infoTimeZones = infoTimeZones + e + "  "
            }else{
                infoTimeZones = infoTimeZones + e + " ; "
            }
        }
        if infoBasica.borders.isEmpty {
            infoBorders = "There are no countries bordering"
        }else{
            for f in infoBasica.borders {
                if infoBasica.borders.count < 1 || infoBasica.borders.count < 2 {
                    infoBorders = infoBorders + f + "  "
                }else{
                    infoBorders = infoBorders + f + " ; "
                }
            }
        }
        let currency : String? = "CURRENCIES: "
        
        let recorrerInfo = ["NAME: " + infoBasica.name, "DOMAIN: " + infoDomain, "CODE: " + infoBasica.alpha2Code, "CODE2: " + infoBasica.alpha3Code, "CODE PHONE NUMBER: " + infoCallingCodes, "CAPITAL: " + infoBasica.capital, (((currency! + currencies.code! as String?)! + ", " + currencies.name! as String?)! + ", " + currencies.symbol! as String?)! ,"SPELLING: " + infoAltSpellings, "REGION: " + infoBasica.region, "SUBREGION: " + infoBasica.subregion, "POPULATION: " + String(infoBasica.population).currencyFormatting(), "DENOMYN: " + infoBasica.demonym, "TIME ZONE: " + infoTimeZones, "BORDERS: " + infoBorders, "NATIVE NAME: " + infoBasica.nativeName, "NUMERIC CODE: " + infoBasica.numericCode! , "TRANSLATION: " + "\n" + "\n" + infoTranslation2 ]
        
        var info : String = ""
        //Hacer esto para recorrer el array y ver todos los paises y sus cosas intentar hacerlo bonito
        for a in recorrerInfo{
            info =  info + a + "\n" + "\n"
            
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0){
            self.textoTxtPrueb.text = info
            
        }
    }

    
}
    
