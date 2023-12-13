//
//  Stats.swift
//  Bucket
//
//  Created by Bezaleel Ashefor on 11/12/2023.
//

import Foundation

struct Stat {
    
    var name : String
    var value : Int
    var type : STAT_TYPE
    var matchID : UUID
    var owner : UUID
    let id = UUID()
    
}
