//
//  BaseViewModel.swift
//  Bucket
//
//  Created by Bezaleel Ashefor on 11/12/2023.
//

import Foundation

import Foundation
import UIKit
import SwiftUI

class BaseViewModel: NSObject, ObservableObject{
    
    //let storeHelper = StoreHelper()
    
    func getDelegate() -> AppDelegate{
        return (UIApplication.shared.delegate) as! AppDelegate
    }
    
}
