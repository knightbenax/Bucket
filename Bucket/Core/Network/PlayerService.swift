//
//  PlayerService.swift
//  Bucket
//
//  Created by Bezaleel Ashefor on 11/12/2023.
//

import Foundation
import Alamofire

class PlayerService : BaseService {
    
    func fetchPlayers() {
        let parameters = ["" : ""]
        AF.request(AppConstants.base_url,
                   method: .post,
                   parameters: parameters,
                   encoder: JSONParameterEncoder.default).response { response in
            debugPrint(response)
        }
    }
    
}
