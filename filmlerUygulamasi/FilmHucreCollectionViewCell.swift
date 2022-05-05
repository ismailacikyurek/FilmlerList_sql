//
//  FilmHucreCollectionViewCell.swift
//  filmlerUygulamasi
//
//  Created by İSMAİL AÇIKYÜREK on 5.05.2022.
//

import UIKit

protocol FilmHucreCollectionViewCellProtocol {
    func sepeteEkle(indexPAth : IndexPath)
}


class FilmHucreCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var lblFilmFiyat: UILabel!
    @IBOutlet weak var lblFimAd: UILabel!
    @IBOutlet weak var imageFilmResim: UIImageView!
    var hucreProtokol : FilmHucreCollectionViewCellProtocol?
    var indexPath : IndexPath?
    
    @IBAction func btnSetepeEKle(_ sender: Any) {
        hucreProtokol?.sepeteEkle(indexPAth: indexPath!)
    }
}
