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
    
    func viewDidLoad() {
        view?.render()
    }
    
    
}


extension HomePresenter : HomeOutputInteractorProtocol {
    
    
}
