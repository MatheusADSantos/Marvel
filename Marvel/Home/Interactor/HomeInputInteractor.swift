//
//  HomeInputInteractor.swift
//  Marvel
//
//  Created by macbook-estagio on 05/05/20.
//  Copyright © 2020 macbook-estagio. All rights reserved.
//


import UIKit
import Alamofire
import SwiftHash
import Foundation

class HomeInputInteractor: HomeInputInteractorProtocol {

    var presenter: HomePresenterProtocol?
    var output: HomeOutputInteractorProtocol?
    
    var heros: [Hero] = []
    var loaddingHeros = false
    var currentPage = 0
    var total = 0
    
    func loadHeros(endpoint: String, page: Int?, onComplete: @escaping (MarvelInfo?) -> Void) {
        print("INPUT")
        MarvelAPI.loadHeros(endpoint: endpoint, page: page) { info in
            
            if let info = info {
                self.heros += info.data.results
                self.total = info.data.total
                print("Total:", self.total, "- Já incluídos:", self.heros.count)
                
//                DispatchQueue.main.async {
                    self.output?.gettingHeros(heros: self.heros)
//                }
            }
        }
    }
    
    
    
//    fileprivate var ts: String = String(Date().timeIntervalSince1970)
//
//    func hash() -> String  {
//        let hash = MD5(ts + Credentials.privateKey + Credentials.publicKey).lowercased()
//        print("\nhash: \(hash)\n")
//        return hash
//    }
//
//    func settingURL(endpoint: String) -> String {
//        let url: String = Credentials.baseUrl + endpoint
//        print("\nURL: \(url)")
//        return url
//    }
    
//    func getCharacters(endpoint: String = Credentials.endpointDefault, page: Int? = 0, onComplete: @escaping (MarvelInfo?) -> Void) {
//        let url = settingURL(endpoint: endpoint)
////        print("Endpoint: \(url)")
//        
//        let offset: String = String(page! * Credentials.limit)
////        print("Offset: \(offset)")
//        
//        Alamofire.request(url, method: .get,
//                          parameters: [
//                            "ts": ts,
//                            "apikey": Credentials.publicKey,
//                            "hash": hash(),
//                            "limit": Credentials.limit,
//                            "offset": offset,
//                            "nameStartsWith": "Spid"
//                          ]).validate().responseJSON { (response) in
//                              guard let data = response.data else {
//                                  onComplete(nil)
//                                  return
//                              }
//                              do {
//                                  let marvelInfo = try JSONDecoder().decode(MarvelInfo.self, from: data)
//                                  onComplete(marvelInfo)
//                              } catch {
//                                  print(error.localizedDescription)
//                                  onComplete(nil)
//                              }
////                              guard let data = response.data,
////                                    let marvelInfo = try? JSONDecoder().decode(MarvelInfo.self, from: data),
////                                    marvelInfo.code == 200 else {
////                                        print("RUIM")
////                                        onComplete(nil)
////                                        return
////                                    }
////                              print("Marvel Info: \(marvelInfo)")
////                              onComplete(marvelInfo)
//                          }
//    }
    
}
