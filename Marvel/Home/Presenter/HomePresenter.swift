//
//  HomePresenter.swift
//  Marvel
//
//  Created by macbook-estagio on 05/05/20.
//  Copyright © 2020 macbook-estagio. All rights reserved.
//

import UIKit

class HomePresenter : HomePresenterProtocol {
    var interactor: HomeInputInteractorProtocol?
    
    var wireframe: HomeWireFrameProtocol?
    
    var view: HomeViewProtocol?
    
    var output: HomeOutputInteractorProtocol?
    
    func viewDidLoad() {
        view?.render()
        view?.additionalConfiguration()
        
        interactor?.loadHeros(endpoint: "v1/public/characters", page: 0, onComplete: { info in
            print("Informações: \(String(describing: info))")
        })
    }
    
    
}


extension HomePresenter : HomeOutputInteractorProtocol {
    
    func gettingHeros(heros: [Hero]) {
        print("OUTPUT")
        view?.addingHerosInTableView(heros: heros)
    }
    
}
