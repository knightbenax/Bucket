//
//  Players.swift
//  Bucket
//
//  Created by Bezaleel Ashefor on 09/12/2023.
//

import SwiftUI

struct Players: View {
    @State var showSettings = false
    @State var players = [Player]()
    @State var headliner : String = ""
    var playersViewModel = PlayersViewModel()
    
    var body: some View {
        VStack{
            HStack{
                Text("Players\(headliner)").font(.custom(FontsManager.Bold, size: 20))
                Spacer()
                Button(action: {
                    showSettings.toggle()
                }){
                    Image(systemName: "slider.horizontal.3").font(.system(size: 22, weight: .medium)).foregroundStyle(Color.label)
                }
            }
            VStack{
                if (players.isEmpty){
                    EmptyView(message: "There are no players yet. \nFetch players to get Bucket started", action: { fetchPlayers() })
                } else {
                    LazyVStack{
                        
                    }
                }
            }
            Spacer()
        }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .leading).padding(30).sheet(isPresented: $showSettings){
            Settings()
        }.onAppear{
            players = playersViewModel.fetchPlayers()
        }
    }
    
    func fetchPlayers(){
        players = playersViewModel.addPlayersFromJSON()
    }
}

#Preview {
    Players()
}
