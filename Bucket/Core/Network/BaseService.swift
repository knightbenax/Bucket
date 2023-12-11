//
//  BaseService.swift
//  Bucket
//
//  Created by Bezaleel Ashefor on 11/12/2023.
//

import Foundation
import Alamofire

class BaseService {
    
    let storeHelper = StoreHelper()
    var headers : HTTPHeaders = []
    
    func getDelegate() -> AppDelegate{
        return (UIApplication.shared.delegate) as! AppDelegate
    }
    
}
