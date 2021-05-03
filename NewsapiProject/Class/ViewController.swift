//
//  ViewController.swift
//  NewsapiProject
//
//  Created by user on 21/4/21.
//

import UIKit
//En el structure, las variables se tienen que llamar igual que en el json si no peta
struct Countries: Codable {
    //15
    let name : String
    let topLevelDomain : [String]
    let alpha2Code, alpha3Code : String
    let callingCodes : [String]
    let capital : String
    let altSpellings : [String]
    let region : String
    let subregion : String
    let population : Int
    let demonym : String
    let timezones, borders : [String]
    let nativeName : String
    let numericCode : String?
    var currencies : [Currency]
    var translations : Translations
}
struct Currency: Codable {
    let code, name, symbol: String?
}
struct Translations : Codable{
        let de, es, fr, ja: String?
        let it: String?
        let br: String
        let fa: String
}

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    @IBOutlet weak var tabla: UITableView!
    
    var pais = [Countries]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getJsonNews()
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        pais.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tabla.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let pc = pais[indexPath.row]
        cell.textLabel?.text = pc.name
        cell.detailTextLabel?.text = pc.alpha2Code
        return cell
    }
    
    func getJsonNews(){
        guard let datos = URL(string: "https://restcountries.eu/rest/v2/all") else { return }
        let url = URLRequest(url: datos)
        
        URLSession.shared.dataTask(with: url){ data,response,error
            in
            do{
                self.pais = try JSONDecoder().decode([Countries].self, from: data!)
                DispatchQueue.main.async {
                    self.tabla.reloadData()
                }
            }catch let error as NSError{
                print("Error al llamar al json", error.localizedDescription)
            }
        }.resume()
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "MostrarInfo", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "MostrarInfo"{
            if let id = tabla.indexPathForSelectedRow{
                let fila = pais[id.row]
                let destino = segue.destination as! InformacionViewController
                destino.infoBasica = fila
            }
            
        }
    }
}

