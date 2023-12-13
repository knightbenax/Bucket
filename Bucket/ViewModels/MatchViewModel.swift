//
//  MatchViewModel.swift
//  Bucket
//
//  Created by Bezaleel Ashefor on 13/12/2023.
//

import Foundation

class MatchViewModel : BaseViewModel{
    
    func clearMatches(){
        storeHelper.clearMatches(delegate: getDelegate())
    }
    
    func addMatch(){
        //storeHelper
    }
    
}
