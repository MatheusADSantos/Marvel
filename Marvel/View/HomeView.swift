//
//  ViewController.swift
//  Marvel
//
//  Created by macbook-estagio on 04/05/20.
//  Copyright © 2020 macbook-estagio. All rights reserved.
//

import UIKit

class HomeView: UIViewController, HomeViewProtocol {
    
    var presenter: HomePresenterProtocol?
    
    func render() {
        print("Renderizando ...")
        view.backgroundColor = .red
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        HomeWireFrame.createModule(viewRef: self)
        presenter?.viewDidLoad()
    }


}

