//
//  HomeTableViewCell.swift
//  NetFlixAppDemo
//
//  Created by Tùng Thiện on 29/12/2022.
//

import UIKit
import Alamofire
import SwiftyJSON
import Kingfisher

class HomeTableViewCell: UITableViewCell {

    @IBOutlet weak var homeCellCollectionView: UICollectionView!
    
    var arrPost:[Results] = []
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        homeCellCollectionView.delegate = self
        homeCellCollectionView.dataSource = self
        homeCellCollectionView.register(UINib(nibName: "HomeCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "homeCollectionView")
        getAPI()
        getAPINowPlaying()
    }
    
    func getAPI() {
        guard let url = URL(string: "https://api.themoviedb.org/3/movie/popular?api_key=4aa49f6e724de742f564b8b9cc4ef039&language=en-US&page=1") else {
            print("URL không tồn tại")
            return
        }
        Alamofire.request(url).responseJSON { response in
            guard let value = response.result.value else {
                print("Không coá data")
                return
            }
            let json = JSON(value)
            let result = json["results"]
            self.arrPost = result.arrayValue.map({item in
                Results(item)
            })
            print(self.arrPost)
            DispatchQueue.main.async {
                self.homeCellCollectionView.reloadData()
            }
        }
    }
    
    func getAPINowPlaying() {
        guard let url = URL(string: "https://api.themoviedb.org/3/movie/now_playing?api_key=4aa49f6e724de742f564b8b9cc4ef039&language=en-US&page=1") else {
            print("URL không tồn tại")
            return
        }
        Alamofire.request(url).responseJSON { response in
            guard let value = response.result.value else {
                return
            }
            let json = JSON(value)
            let result = json["results"]
            self.arrPost = result.arrayValue.map({item in
                Results(item)
            })
            DispatchQueue.main.async {
                self.homeCellCollectionView.reloadData()
            }
        }
    }
}

extension HomeTableViewCell:UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrPost.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 1{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "homeCollectionView", for: indexPath) as! HomeCollectionViewCell
            cell.homeCollectionCellImage.kf.setImage(with: URL(string: "https://image.tmdb.org/t/p/w500" + arrPost[indexPath.row].posterPath))
            return cell
        }
        else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "homeCollectionView", for: indexPath) as! HomeCollectionViewCell
            cell.homeCollectionCellImage.kf.setImage(with: URL(string: "https://image.tmdb.org/t/p/w500" + arrPost[indexPath.row].posterPath))
            return cell
        }
    }
}

extension HomeViewController: UICollectionViewDelegateFlowLayout {
     
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
////        let width = collectionView.bounds.size.width
////        let height = CGFloat(width/858*1274)
////        return .init(width: width, height: height)
//        //let width = tableView.bounds.width
//        //let height = width/858*1274
//        //return height
//    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
