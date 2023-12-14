//
//  PlayersViewModel.swift
//  Bucket
//
//  Created by Bezaleel Ashefor on 11/12/2023.
//

import Foundation

struct ResponseData: Decodable {
    var players: [Player]
}

class PlayersViewModel : BaseViewModel {
    
    private func loadJson(filename fileName: String) -> [Player]? {
        if let url = Bundle.main.url(forResource: fileName, withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode(ResponseData.self, from: data)
                return jsonData.players
            } catch {
                print("error:\(error)")
            }
        }
        return nil
    }
    
    func addPlayersFromJSON() -> [Player]{
        var players = loadJson(filename: "players") ?? [Player]()
        
        
        for index in players.indices {
            players[index].id = UUID()
            storeHelper.savePlayer(delegate: getDelegate(), player: players[index])
        }

        return players.sorted { $0.name < $1.name }
    }
    
    func fetchPlayers() -> [Player] {
        return storeHelper.getPlayers(delegate: getDelegate()).sorted { $0.name < $1.name }
    }
    
    func clearPlayers(){
        storeHelper.clearPlayers(delegate: getDelegate())
    }
    
}
