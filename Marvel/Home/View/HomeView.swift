//
//  ViewController.swift
//  Marvel
//
//  Created by macbook-estagio on 04/05/20.
//  Copyright © 2020 macbook-estagio. All rights reserved.
//

import UIKit
import SnapKit

class HomeView: UIViewController, HomeViewProtocol {
    
    var presenter: HomePresenterProtocol?
    let cellID = "tableView"
//    var heros = [Hero]()
    
    var heros: [Hero]? {
        didSet {
//            if let name = heros.name {
//
//            }
            print("Called after setting this value \nHeros in View (didset): ", heros)
        }
        willSet(newValue) {
            print("Called before setting this value \nHeros in View (willset): ", newValue)
        }
    }
    
    let logoMarvel: UIImageView = {
        let imageView = UIImageView()
        var image = UIImage(named: "marvelLogo")
        imageView.setImage(name: "marvelLogo", x: 0, y: 0, width: 0, height: 0)
        return imageView
    }()

    let tableViewCharacters : UITableView = {
        let tb = UITableView()
        tb.backgroundColor = .clear
        return tb
    }()
    
    let array = ["teste", "teste2", "teste3", "teste4", "teste5", "teste6", "teste7"]
//    let heros: [Hero] = []
    
    var names: [String] = [String]()
    var images: [UIImage] = [UIImage]()
    
    
    func addingHerosInTableView(heros: [Hero]) {
        print("Adding heros ...")
        self.heros = heros
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        HomeWireFrame.createModule(viewRef: self)
        presenter?.viewDidLoad()
//        presenter?.interactor?.getCharacters(endpoint: "/v1/public/characters/", page: 0)
        additionalConfiguration()
        view.backgroundColor = .systemGray4
    }
    
    func additionalConfiguration() {
        tableViewCharacters.delegate = self
        tableViewCharacters.dataSource = self
        tableViewCharacters.register(TableViewCellCharacters.self, forCellReuseIdentifier: cellID)
    }

    func render() {
        print("Renderizando ...")
        view.backgroundColor = .white
        
        view.addSubviews(viewsToAdd: logoMarvel, tableViewCharacters)

        logoMarvel.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(32)
            make.left.equalToSuperview().offset(10)
            make.right.equalToSuperview().offset(-10)
            make.height.equalTo(140)
        }
        tableViewCharacters.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            
            make.top.equalTo(logoMarvel.snp.bottom).offset(20)
            make.left.equalToSuperview().offset(10)
            make.right.equalToSuperview().offset(-10)
            
            make.bottom.equalToSuperview().offset(-120)
        }
        
        
    }

}

//MARK: - Delegates da TabelView
extension HomeView : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! TableViewCellCharacters
//        cell.setShadow(alpha: 1, offSetX: 1, offSetY: 1, shadowOpacity: 1, shadowRadius: 2, boolean: true)
//        let cat = categories[indexPath.row]
//        cell.imageCategory.image = UIImage(named: cat.image)
        
//        cell.textLabel?.text = array[indexPath.row]
        cell.labelName.text = array[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        CGFloat.heigthComponent * 1.4
        CGFloat(50)
    }
    
}

