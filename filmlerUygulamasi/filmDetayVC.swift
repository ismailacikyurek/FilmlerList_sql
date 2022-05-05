//
//  filmDetayVC.swift
//  filmlerUygulamasi
//
//  Created by İSMAİL AÇIKYÜREK on 5.05.2022.
//

import UIKit

class filmDetayVC: UIViewController {
    
    @IBOutlet weak var imageViewFilm: UIImageView!
    @IBOutlet weak var lblfilmAdi: UILabel!
    @IBOutlet weak var lblFilmYili: UILabel!
    @IBOutlet weak var lblFilmTuru: UILabel!
    @IBOutlet weak var lblYonetmenAdi: UILabel!
    
    var film  : Filmler?
    override func viewDidLoad() {
        super.viewDidLoad()
        if let f = film {
            
            
            lblfilmAdi.text = f.film_ad
            lblFilmYili.text = String(f.film_yil!)
            lblFilmTuru.text = f.kategori?.kategori_ad
            lblYonetmenAdi.text = f.yonetmen?.yonetmen_adi
            imageViewFilm.image = UIImage(named: f.film_resim!)
        }
       
    }
    


}
