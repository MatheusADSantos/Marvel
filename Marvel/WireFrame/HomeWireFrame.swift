//
//  HomeWireFrame.swift
//  Marvel
//
//  Created by macbook-estagio on 05/05/20.
//  Copyright © 2020 macbook-estagio. All rights reserved.
//

import UIKit

class HomeWireFrame : HomeWireFrameProtocol {
    
    var controller: HomeView
    
    init(_ controller : HomeView) {
        self.controller = controller
    }
    
    static func createModule(viewRef: HomeView) {
        let presenter : HomePresenterProtocol & HomeOutputInteractorProtocol = HomePresenter()
        
        viewRef.presenter = presenter
        viewRef.presenter?.view = viewRef
        viewRef.presenter?.interactor = HomeInputInteractor()
        viewRef.presenter?.wireframe = HomeWireFrame(viewRef)
    }
    
}
