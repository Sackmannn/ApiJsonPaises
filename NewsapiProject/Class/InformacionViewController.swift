//
//  InformacionViewController.swift
//  NewsapiProject
//
//  Created by user on 22/4/21.
//

import UIKit
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
    var allowMultiline : Bool = true
    
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
        
        let infoTranslation : [String?] = [infoBasica.translations.br, infoBasica.translations.de, infoBasica.translations.es, infoBasica.translations.fa,infoBasica.translations.fr,infoBasica.translations.hr, infoBasica.translations.it,infoBasica.translations.ja,infoBasica.translations.nl,infoBasica.translations.pt]
    
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
        let recorrerInfo = ["NAME: " + infoBasica.name, "DOMAIN: " + infoDomain, "CODE: " + infoBasica.alpha2Code, "CODE2: " + infoBasica.alpha3Code, "CODE PHONE NUMBER: " + infoCallingCodes, "CAPITAL: " + infoBasica.capital, "SPELLING: " + infoAltSpellings, "REGION: " + infoBasica.region, "SUBREGION: " + infoBasica.subregion, "POPULATION: " + String(infoBasica.population).currencyFormatting(), "DENOMYN: " + infoBasica.demonym, "TIME ZONE: " + infoTimeZones, "BORDERS: " + infoBorders, "NATIVE NAME: " + infoBasica.nativeName, "NUMERIC CODE: " + infoBasica.numericCode! , "TRANSLATION: " + "\n" + "\n" + infoTranslation2]
        
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
