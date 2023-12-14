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
    
    func addMatch(match: Match){
        storeHelper.saveMatch(delegate: getDelegate(), match: match)
    }
    
    func editMatch(match: Match){
        storeHelper.editMatch(delegate: getDelegate(), match: match)
    }
    
    func getMatches(stage: MATCH_TYPE) -> [Match] {
        return storeHelper.getMatches(delegate: getDelegate(), stage: stage)
    }
    
    func getMatchesToPlayer(player : UUID) -> [Match] {
        return storeHelper.getMatchesToPlayer(delegate: getDelegate(), player: player)
    }
    
    func getUnseededMatches(stage: MATCH_TYPE, seeded: Bool) -> [Match] {
        return storeHelper.getUnSeededMatches(delegate: getDelegate(), stage: stage, seeded: seeded)
    }
    
}
