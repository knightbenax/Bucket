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
        let players = loadJson(filename: "players") ?? [Player]()
        players.forEach{
            storeHelper.savePlayer(delegate: getDelegate(), player: $0)
        }
        return players
    }
    
    func fetchPlayers() -> [Player] {
        return storeHelper.getPlayers(delegate: getDelegate())
    }
    
}
