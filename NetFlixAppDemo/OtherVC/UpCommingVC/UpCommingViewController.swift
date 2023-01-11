//
//  UpCommingViewController.swift
//  NetFlixAppDemo
//
//  Created by Tùng Thiện on 29/12/2022.
//

import UIKit

class UpCommingViewController: UIViewController {

    @IBOutlet weak var commingTableView: UITableView!
    
    var arrayComming:[commingCellModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        config()
        addArray()
    }
    
    func addArray() {
        arrayComming = [
            commingCellModel(commingImage: "img_nguoinhen", commingLabel: "Người Nhện"),
            commingCellModel(commingImage: "img_nguoinhen", commingLabel: "Người Nhện 2"),
            commingCellModel(commingImage: "img_nguoinhen", commingLabel: "Người Nhện 3"),
            commingCellModel(commingImage: "img_nguoinhen", commingLabel: "Người Nhện 4"),
            commingCellModel(commingImage: "img_nguoinhen", commingLabel: "Người Nhện 5"),
            commingCellModel(commingImage: "img_nguoinhen", commingLabel: "Người Nhện 6"),
        ]
    }
    
    func config() {
        commingTableView.delegate = self
        commingTableView.dataSource = self
        commingTableView.register(UINib(nibName: "CommingSoonTableViewCell", bundle: nil), forCellReuseIdentifier: "commingCell")
        view.backgroundColor = .systemBackground
    }
}

extension UpCommingViewController:UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayComming.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "commingCell", for: indexPath) as! CommingSoonTableViewCell
        cell.commingImage.image = UIImage(named: arrayComming[indexPath.row].commingImage)
        cell.commingLabel.text = arrayComming[indexPath.row].commingLabel
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.bounds.size.height / CGFloat(arrayComming.count)
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
