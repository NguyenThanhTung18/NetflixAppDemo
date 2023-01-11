//
//  SearchViewController.swift
//  NetFlixAppDemo
//
//  Created by Tùng Thiện on 29/12/2022.
//

import UIKit

class SearchViewController: UIViewController {

    @IBOutlet weak var searchTableView: UITableView!
    
    var arraySearch:[commingCellModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        config()
        addArraySearch()
    }
    func config() {
        searchTableView.delegate = self
        searchTableView.dataSource = self
        searchTableView.register(UINib(nibName: "CommingSoonTableViewCell", bundle: nil), forCellReuseIdentifier: "searchCell")
        view.backgroundColor = .systemBackground
    }
    
    func addArraySearch() {
        arraySearch = [
            commingCellModel(commingImage: "img_nguoinhen", commingLabel: "Người Nhện"),
            commingCellModel(commingImage: "img_nguoinhen", commingLabel: "Người Nhện 2"),
            commingCellModel(commingImage: "img_nguoinhen", commingLabel: "Người Nhện 3"),
            commingCellModel(commingImage: "img_nguoinhen", commingLabel: "Người Nhện 4"),
            commingCellModel(commingImage: "img_nguoinhen", commingLabel: "Người Nhện 5"),
            commingCellModel(commingImage: "img_nguoinhen", commingLabel: "Người Nhện 6"),
        ]
    }
}

extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arraySearch.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "searchCell",for: indexPath) as! CommingSoonTableViewCell
        cell.commingImage.image = UIImage(named: arraySearch[indexPath.row].commingImage)
        cell.commingLabel.text = arraySearch[indexPath.row].commingLabel
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.bounds.size.height / CGFloat(arraySearch.count)
    }
}
