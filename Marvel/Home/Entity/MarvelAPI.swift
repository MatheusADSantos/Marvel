//
//  MarvelAPI.swift
//  Marvel
//
//  Created by macbook-estagio on 01/11/21.
//  Copyright © 2021 macbook-estagio. All rights reserved.
//

import Foundation
import Alamofire
import SwiftHash

class MarvelAPI {
    class func loadHeros(endpoint: String = Credentials.endpointDefault, page: Int? = 0, onComplete: @escaping (MarvelInfo?) -> Void) {
        
        let ts: String = String(Date().timeIntervalSince1970)
        
        func hash() -> String  {
            let hash = MD5(ts + Credentials.privateKey + Credentials.publicKey).lowercased()
            print("\nhash: \(hash)\n")
            return hash
        }
        
        func settingURL(endpoint: String) -> String {
            let url: String = Credentials.baseUrl + endpoint
            print("\nURL: \(url)")
            return url
        }
        
        let url = settingURL(endpoint: endpoint)
        let offset: String = String(page! * Credentials.limit)
        let parameters: Parameters = ["ts": ts,
                                      "apikey": Credentials.publicKey,
                                      "hash": hash(),
                                      "limit": Credentials.limit,
                                      "offset": offset,
                                      "nameStartsWith": "Spid"]
        
        Alamofire.request(url, method: .get, parameters: parameters).validate().responseJSON { (response) in
                              guard let data = response.data else {
                                  onComplete(nil)
                                  return
                              }
                              do {
                                  let marvelInfo = try JSONDecoder().decode(MarvelInfo.self, from: data)
                                  onComplete(marvelInfo)
                              } catch {
                                  print(error.localizedDescription)
                                  onComplete(nil)
                              }
                          }
    }
}
