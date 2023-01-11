//
//  BannerTableViewCell.swift
//  NetFlixAppDemo
//
//  Created by Tùng Thiện on 29/12/2022.
//

import UIKit

class BannerTableViewCell: UITableViewCell {

    
    @IBOutlet weak var listButton: UIButton!
    
    @IBOutlet weak var bannerImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        bannerImage.image = UIImage(named: "img_nguoinhen")
        
        listButton.setTitle("Danh Sách", for: .normal)
        listButton.layer.borderColor = UIColor.white.cgColor
        listButton.layer.borderWidth = 1
        
    }
    
}
