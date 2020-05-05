//
//  HomeProtocols.swift
//  Marvel
//
//  Created by macbook-estagio on 05/05/20.
//  Copyright © 2020 macbook-estagio. All rights reserved.
//

import UIKit

protocol HomeViewProtocol : class {
    var presenter : HomePresenterProtocol? { get set }
    func render()
}

protocol HomePresenterProtocol : class {
    var view : HomeViewProtocol? { get set }
    var interactor : HomeInputInteractorProtocol? { get set }
    var wireframe : HomeWireFrameProtocol? { get set }
    
    func viewDidLoad()
}

protocol HomeInputInteractorProtocol : class {
    
}

protocol HomeWireFrameProtocol : class {
    var controller : HomeView { get set }
    static func createModule(viewRef: HomeView)
}

protocol HomeOutputInteractorProtocol : class {
    
}
