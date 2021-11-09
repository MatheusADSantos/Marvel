//
//  HomeProtocols.swift
//  Marvel
//
//  Created by macbook-estagio on 05/05/20.
//  Copyright © 2020 macbook-estagio. All rights reserved.
//

import UIKit

protocol HomeViewProtocol : AnyObject {
    var presenter : HomePresenterProtocol? { get set }
    
    func render()
    func additionalConfiguration()
//    func addingHerosInTableView(name: [String], image: [UIImage])
    func addingHerosInTableView(heros: [Hero])
}

protocol HomePresenterProtocol : AnyObject {
    var view : HomeViewProtocol? { get set }
    var interactor : HomeInputInteractorProtocol? { get set }
    var wireframe : HomeWireFrameProtocol? { get set }
    
    func viewDidLoad()
}

protocol HomeInputInteractorProtocol : AnyObject {
    
    var presenter : HomePresenterProtocol? { get set }
    var output: HomeOutputInteractorProtocol? { get set }
    
    func loadHeros(endpoint: String, page: Int?, onComplete: @escaping (MarvelInfo?) -> Void)
}

protocol HomeOutputInteractorProtocol : AnyObject {
    
//    func loaddingCharacters(view: UIViewController, data: [String])
//    func gettingHeros(name: [String], image: [UIImage])
    func gettingHeros(heros: [Hero])
}

protocol HomeWireFrameProtocol : AnyObject {
    var controller : HomeView { get set }
    
    static func createModule(viewRef: HomeView)
}
