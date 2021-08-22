//
//  HeroesViewController.swift
//  BreakingBadAPi
//
//  Created by Сергей Кудинов on 20.08.2021.
//

import UIKit
import Alamofire

private let reuseIdentifier = "Cell"

class HeroesViewController: UICollectionViewController {
    
    let url = "https://breakingbadapi.com/api/characters"
    let itemsPerRow: CGFloat = 2
    let sectionInserts = UIEdgeInsets(top: 20,
                                      left: 20,
                                      bottom: 20,
                                      right: 20)
    
    var heroes = [WelcomeElement]()

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return heroes.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! HeroesViewCell
        let hero = heroes[indexPath.row]
        
        cell.configureCell(hero: hero)
        
        return cell
    }
}


extension HeroesViewController: UICollectionViewDelegateFlowLayout {
    
    func fetchData() {
        
        AF.request(url)
            .validate()
            .responseJSON { dataResponse in
                switch dataResponse.result {
                case .success(let value):
                    guard let heroesData = value as? [[String: Any]] else { return }
                    for heroData in heroesData {
                        let hero = WelcomeElement(charID: heroData["charID"] as? Int,
                                                  name: heroData["name"] as? String,
                                                  occupation: [heroData["occupation"]] as? [String],
                                                  img: heroData["img"] as? String,
                                                  nickname: heroData["nickname"] as? String,
                                                  appearance: [heroData["appearance"]] as? [Int],
                                                  portrayed: heroData["portrayed"] as? String,
                                                  betterCallSaulAppearance: heroData["betterCallSaulAppearance"] as? [Int])
                        self.heroes.append(hero)
                        DispatchQueue.main.async {
                            self.collectionView.reloadData()
                        }
                    }
                case .failure(let error):
                    print(error)
                }
            }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let paddingWidth = sectionInserts.top * (itemsPerRow + 1)
        let avaibleWidth = collectionView.frame.width - paddingWidth
        let widthParItem = avaibleWidth / itemsPerRow
        let heightParItem = widthParItem * 1.5

        return CGSize(width: widthParItem, height: heightParItem)
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: sectionInserts.top,
                            left: sectionInserts.left,
                            bottom: sectionInserts.bottom,
                            right: sectionInserts.right)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        sectionInserts.left
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        sectionInserts.right
    }
    
}
