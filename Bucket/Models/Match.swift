//
//  Match.swift
//  Bucket
//
//  Created by Bezaleel Ashefor on 11/12/2023.
//

import Foundation

struct Match {
    
    var firstPlayer : UUID
    var secondPlayer : UUID
    var firstPlayerName : String
    var secondPlayerName : String
    var firstPlayerScore : Int
    var secondPlayerScore : Int
    var firstThreePoint : Int
    var secondThreePoint : Int
    var firstTwoPoint : Int
    var secondTwoPoint : Int
    var firstFoulPoint : Int
    var secondFoulPoint : Int
    var firstBlockPoint : Int
    var secondBlockPoint : Int
    var stage : MATCH_TYPE
    var seeded : Bool
    var id = UUID()
    
}
