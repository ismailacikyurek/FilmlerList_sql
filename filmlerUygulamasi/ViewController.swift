//
//  ViewController.swift
//  filmlerUygulamasi
//
//  Created by İSMAİL AÇIKYÜREK on 5.05.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var kategoriTableView: UITableView!
    
    
    var kategorilerListe = [Kategoriler]()
    override func viewDidLoad() {
        super.viewDidLoad()
    
        VeriTabaniKopyala()
        kategoriTableView.delegate = self
        kategoriTableView.dataSource = self
        kategorilerListe = Kategorilerdao().tumKategorilerAl()
    }
    func VeriTabaniKopyala() {
        
        let bundleYOl = Bundle.main.path(forResource: "filmler", ofType:".sqlite")
        let hedefYol = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let fileManager = FileManager.default
        let kopyalanacakYer = URL(fileURLWithPath: hedefYol).appendingPathComponent("filmler.sqlite")
        if fileManager.fileExists(atPath: kopyalanacakYer.path) {
            print("veritabanı zaten var. kopyalamaya gerek yok")
        } else {
            do {
                try fileManager.copyItem(atPath: bundleYOl!, toPath: kopyalanacakYer.path)
            }catch {
                print(error)
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let indeks = sender as? Int
        
        let gidilecekVC = segue.destination as! FilmVC
        gidilecekVC.kategori = kategorilerListe[indeks!]
    }

}


extension ViewController : UITableViewDataSource,UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        kategorilerListe.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let kategori = kategorilerListe[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "kategoriHucre", for: indexPath) as! KategoriTableViewCell
        cell.lblKategori.text = kategori.kategori_ad
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "toFilm", sender: indexPath.row)
    }
    
}

