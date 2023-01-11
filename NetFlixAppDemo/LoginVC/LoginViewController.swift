//
//  LoginViewController.swift
//  NetFlixAppDemo
//
//  Created by Tùng Thiện on 30/12/2022.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var loginCollectionView: UICollectionView!
    
    var arrayLogoLogin:[loginModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        config()
        addArrayLogo()
    }
    
    @IBAction func loginButton(_ sender: Any) {
        let vc = MainTabBarViewController()
        vc.modalPresentationStyle = .fullScreen
        vc.modalTransitionStyle = .crossDissolve
        self.present(vc, animated: true, completion: nil)
    }
    
    @IBAction func privacyButton(_ sender: Any) {
        
    }
    
    func config() {
        
        loginCollectionView.register(UINib(nibName: "LoginCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "loginCell")
    }
    
    func addArrayLogo() {
        arrayLogoLogin = [
            loginModel(loginImage: "logo_1"),
            loginModel(loginImage: "logo_2"),
            loginModel(loginImage: "logo_3")
        ]
    }
}

extension LoginViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrayLogoLogin.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "loginCell", for: indexPath) as! LoginCollectionViewCell
        cell.loginImage.image = UIImage(named: arrayLogoLogin[indexPath.row].loginImage)
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: collectionView.bounds.size.width, height: collectionView.bounds.size.height)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        0
    }
}

