//
//  FilmVC.swift
//  filmlerUygulamasi
//
//  Created by İSMAİL AÇIKYÜREK on 5.05.2022.
//

import UIKit

class FilmVC: UIViewController {

    @IBOutlet weak var filmCollectionView: UICollectionView!
    
    
    var filmListesi = [Filmler]()
    
    var kategori : Kategoriler?
    override func viewDidLoad() {
        super.viewDidLoad()
        print(filmListesi.count)
        if let k = kategori {
            navigationItem.title = k.kategori_ad
            filmListesi = Filmlerdao().filmlerAl(kategori_id: k.kategori_id!)
        }
        
        filmCollectionView.delegate = self
        filmCollectionView.dataSource = self
        let tasarim :UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        
        let genislik = self.filmCollectionView.frame.size.width
        
        tasarim.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        
        let hucreGenislik = (genislik-80)/2
        
        tasarim.itemSize = CGSize(width: hucreGenislik, height: hucreGenislik*1.7)
        
        tasarim.minimumInteritemSpacing = 10
        tasarim.minimumLineSpacing = 10
        
        filmCollectionView.collectionViewLayout = tasarim
       
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let indeks = sender as? Int
        
        let gidilecekVC = segue.destination as! filmDetayVC
        gidilecekVC.film = filmListesi[indeks!]
    }

   

}

extension FilmVC : UICollectionViewDelegate,UICollectionViewDataSource,FilmHucreCollectionViewCellProtocol {
    func sepeteEkle(indexPAth: IndexPath) {
        print("sepete eklenen film \(filmListesi[indexPAth.row].film_ad!)")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        filmListesi.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let film = filmListesi[indexPath.row]
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "filmHucre", for: indexPath) as! FilmHucreCollectionViewCell
        cell.imageFilmResim.image = UIImage(named: film.film_resim!)
        cell.lblFimAd.text = film.film_ad
        cell.lblFilmFiyat.text = "14.00 tl"
        
        cell.layer.borderColor = UIColor.lightGray.cgColor
        cell.layer.borderWidth = 1
        
        cell.hucreProtokol = self
        cell.indexPath = indexPath
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "toDetay", sender: indexPath.row)
    }
    
}
