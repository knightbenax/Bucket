//
//  Stats.swift
//  Bucket
//
//  Created by Bezaleel Ashefor on 09/12/2023.
//

import SwiftUI

enum STAT_TYPE : Int, Equatable{
    
    case THREEPOINT = 0
    case TWOPOINT = 1
    case BLOCKS = 2
    case FOUL = 3
    case SCORE = 4
}

struct Stats: View {
    @State var showSettings = false
    @State var scoreStats = [Stat]()
    @State var threePointStats = [Stat]()
    @State var twoPointStats = [Stat]()
    @State var foulStats = [Stat]()
    @State var blockStats = [Stat]()
    @State var headliner : String = ""
    @ObservedObject var viewObserver : ViewObserver
    var playersViewModel = PlayersViewModel()
    var matchesViewModel = MatchViewModel()
    var maxWidth: CGFloat = 620
    
    let columns = [
        GridItem(.flexible(), spacing: 12),
    ]
    
    var body: some View {
        VStack{
            ZStack(alignment: .top){
                if (!scoreStats.isEmpty || !threePointStats.isEmpty || !twoPointStats.isEmpty || !foulStats.isEmpty || !blockStats.isEmpty){
                    ScrollView(showsIndicators: false){
                        HStack{
                            Text("Total Points").font(.custom(FontsManager.Regular, size: 16))
                            Spacer()
                        }.padding(.top, 115).padding(.horizontal, 10).frame(maxWidth: maxWidth)
                        LazyVGrid(columns: columns, spacing: 12) {
                            ForEach($scoreStats.prefix(3), id: \.id) { stat in
                                SingleStat(stat: stat).frame(maxWidth: maxWidth)
                            }
                        }.padding(.bottom, 20)
                            .padding(.top, 10)
                            
                        
                        HStack{
                            Text("3-Points").font(.custom(FontsManager.Regular, size: 16)).font(.custom(FontsManager.Regular, size: 16))
                            Spacer()
                        }.padding(.horizontal, 10).padding(.top, 10).frame(maxWidth: maxWidth)
                        
                        LazyVGrid(columns: columns, spacing: 12) {
                            ForEach($threePointStats.prefix(3), id: \.id) { stat in
                                SingleStat(stat: stat)
                            }
                        }.padding(.bottom, 20)
                            .padding(.top, 10)
                            .frame(maxWidth: maxWidth)
                        
                        
                        HStack{
                            Text("2-Points").font(.custom(FontsManager.Regular, size: 16))
                            Spacer()
                        }.padding(.horizontal, 10).padding(.top, 10).frame(maxWidth: maxWidth)
                        LazyVGrid(columns: columns, spacing: 12) {
                            ForEach($twoPointStats.prefix(3), id: \.id) { stat in
                                SingleStat(stat: stat).frame(maxWidth: maxWidth)
                            }
                        }.padding(.bottom, 20)
                            .padding(.top, 10)
                            
                        
                        HStack{
                            Text("Fouls").font(.custom(FontsManager.Regular, size: 16))
                            Spacer()
                        }.padding(.horizontal, 10).padding(.top, 10).frame(maxWidth: maxWidth)
                        LazyVGrid(columns: columns, spacing: 12) {
                            ForEach($foulStats.prefix(3), id: \.id) { stat in
                                SingleStat(stat: stat).frame(maxWidth: maxWidth)
                            }
                        }.padding(.bottom, 20).padding(.top, 10)
                        
                        
                        HStack{
                            Text("Blocks").font(.custom(FontsManager.Regular, size: 16))
                            Spacer()
                        }.padding(.horizontal, 10).padding(.top, 10).frame(maxWidth: maxWidth)
                        LazyVGrid(columns: columns, spacing: 12) {
                            ForEach($blockStats.prefix(3), id: \.id) { stat in
                                SingleStat(stat: stat).frame(maxWidth: maxWidth)
                            }
                        }.padding(.bottom, 120).padding(.top, 10)
                    }.frame(minWidth: 0, maxWidth: .infinity).ignoresSafeArea()
                }
                VStack{
                    HStack{
                        Text("Stats\(headliner)").font(.custom(FontsManager.Bold, size: 20))
                        Spacer()
                        Button(action: {
                            showSettings.toggle()
                        }){
                            Image(systemName: "slider.horizontal.3").font(.system(size: 22, weight: .medium)).foregroundStyle(Color.label)
                        }
                    }.padding(.top, 20).padding(.bottom, 15).padding(.horizontal, 30).background(.ultraThinMaterial)
                    if (scoreStats.isEmpty && threePointStats.isEmpty && twoPointStats.isEmpty && foulStats.isEmpty && blockStats.isEmpty){
                        EmptyView(message: "There are no stats yet. \nOnce games start, stats show up here", showButton: false)
                    }
                }
            }
        }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .leading).sheet(isPresented: $showSettings){
            Settings(viewObserver: viewObserver)
        }.onChange(of: viewObserver.clearStats, perform: { value in

            scoreStats = [Stat]()
            threePointStats = [Stat]()
            twoPointStats = [Stat]()
            foulStats = [Stat]()
            blockStats = [Stat]()
        }).onAppear{
            loadStatsData()
        }
    }
    
    
    func loadStatsData(){
        let players = playersViewModel.fetchPlayers()
        for player in players {
            let matches = matchesViewModel.getMatchesToPlayer(player: player.id ?? UUID())
            var scoreValue = 0
            var threePointValue = 0
            var twoPointValue = 0
            var foulsValue = 0
            var blocksValue = 0
            for match in matches {
                if (match.firstPlayer == player.id){
                    scoreValue = scoreValue + match.firstPlayerScore
                    threePointValue = threePointValue + match.firstThreePoint
                    twoPointValue = twoPointValue + match.firstTwoPoint
                    foulsValue = foulsValue + match.firstFoulPoint
                    blocksValue = blocksValue + match.firstBlockPoint
                } else if (match.secondPlayer == player.id) {
                    scoreValue = scoreValue + match.secondPlayerScore
                    threePointValue = threePointValue + match.secondThreePoint
                    twoPointValue = twoPointValue + match.secondTwoPoint
                    foulsValue = foulsValue + match.secondFoulPoint
                    blocksValue = blocksValue + match.secondBlockPoint
                }
            }
            scoreStats.append(Stat(ownerName: player.name, value: scoreValue, type: .SCORE, owner: player.id ?? UUID()))
            threePointStats.append(Stat(ownerName: player.name, value: threePointValue, type: .THREEPOINT, owner: player.id ?? UUID()))
            twoPointStats.append(Stat(ownerName: player.name, value: twoPointValue, type: .TWOPOINT, owner: player.id ?? UUID()))
            foulStats.append(Stat(ownerName: player.name, value: foulsValue, type: .FOUL, owner: player.id ?? UUID()))
            blockStats.append(Stat(ownerName: player.name, value: blocksValue, type: .BLOCKS, owner: player.id ?? UUID()))
            
            
        }
        
        scoreStats = scoreStats.sorted { $0.value > $1.value }
        threePointStats = threePointStats.sorted { $0.value > $1.value }
        twoPointStats = twoPointStats.sorted { $0.value > $1.value }
        foulStats = foulStats.sorted { $0.value > $1.value }
        blockStats = blockStats.sorted { $0.value > $1.value }
        
        
    }
}

#Preview {
    Stats(viewObserver: ViewObserver())
}
