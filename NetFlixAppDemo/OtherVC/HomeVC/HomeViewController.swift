//
//  HomeViewController.swift
//  NetFlixAppDemo
//
//  Created by Tùng Thiện on 29/12/2022.
//

import UIKit

class HomeViewController: UIViewController {

    
    @IBOutlet weak var homeTableView: UITableView!
    
    let sectionTitle:[String] = ["","Popular", "Now Playing", "Upcomming", "Top rate"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        config()
    }
    
    func config() {
        homeTableView.delegate = self
        homeTableView.dataSource = self
//        homeTableView.tableHeaderView = UIView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 450))
        homeTableView.register(UINib(nibName: "HomeTableViewCell", bundle: nil), forCellReuseIdentifier: "homeCell")
        homeTableView.register(UINib(nibName: "BannerTableViewCell", bundle: nil), forCellReuseIdentifier: "bannerCell")
        
        view.backgroundColor = .black

        let netflixLogo = UIBarButtonItem(image: UIImage(named: "logo_netflix")?.withRenderingMode(.alwaysOriginal), style: .done, target: nil, action: nil)
        let loginButton = UIBarButtonItem(image: UIImage(systemName: "person.circle"), style: .done, target: nil, action: nil)
        navigationItem.leftBarButtonItem = netflixLogo
        navigationItem.rightBarButtonItem = loginButton
        
        //navigationController?.navigationBar.barTintColor = .blue
        navigationController?.navigationBar.barStyle = .black
    }
}

extension HomeViewController:UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionTitle.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0 :
            return 1
        default:
            return 1
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "bannerCell", for: indexPath) as!
            BannerTableViewCell
            return cell
        }
        else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "homeCell",for: indexPath) as! HomeTableViewCell
            cell.backgroundColor = .black
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return ""
        }
        else {
            return sectionTitle[section]
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            let width = tableView.bounds.width
            let height = width/858*1274
            return height
        }
        else {
            return 150
        }
    }
}
