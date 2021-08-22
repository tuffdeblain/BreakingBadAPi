//
//  HeroesViewCell.swift
//  BreakingBadAPi
//
//  Created by Сергей Кудинов on 20.08.2021.
//

import UIKit

class HeroesViewCell: UICollectionViewCell {
    @IBOutlet weak var heroImage: UIImageView!
    
    func configureCell(hero: WelcomeElement) {
        
        
        DispatchQueue.global().async {
            guard let url = hero.img else {return}
            guard let imageURL = URL(string: url) else { return }
            guard let imageData = try? Data(contentsOf: imageURL) else { return }
            
            DispatchQueue.main.async {
                self.layer.cornerRadius = self.frame.height / 25
                self.heroImage.image = UIImage(data: imageData)
            }
        }
        
    }
}
