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
    @ObservedObject var viewObserver : ViewObserver
    var maxWidth: CGFloat = 620
    
    var body: some View {
        ZStack(alignment: .top){
            if (!players.isEmpty){
                ScrollView(showsIndicators: false){
                    LazyVStack(spacing: 15){
                        ForEach($players, id: \.id) { player in
                            SinglePlayer(player: player).frame(maxWidth: maxWidth)
                        }
                    }.padding(.bottom, 100).padding(.top, 100)
                }.ignoresSafeArea()
            }
            VStack{
                HStack{
                    Text("Players\(headliner)").font(.custom(FontsManager.Bold, size: 20))
                    Spacer()
                    Button(action: {
                        showSettings.toggle()
                    }){
                        Image(systemName: "slider.horizontal.3").font(.system(size: 22, weight: .medium)).foregroundStyle(Color.label)
                    }
                }.padding(.top, 20).padding(.bottom, 15).padding(.horizontal, 30).background(.ultraThinMaterial)
                if (players.isEmpty){
                    EmptyView(message: "There are no players yet. \nFetch players to get Bucket started", action: { fetchPlayers() })
                }
            }
            
        }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .leading).sheet(isPresented: $showSettings){
            Settings(viewObserver: viewObserver)
        }.onAppear{
            players = playersViewModel.fetchPlayers()
            headliner = " - \(players.count) players"
        }.onChange(of: viewObserver.clearPlayers, perform: { value in
            if (value){
                players = [Player]()
            }
        })
    }
    
    func fetchPlayers(){
        players = playersViewModel.addPlayersFromJSON()
        headliner = " - \(players.count) players"
    }
}

#Preview {
    Players(viewObserver: ViewObserver())
}
