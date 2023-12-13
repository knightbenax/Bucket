//
//  Standings.swift
//  Bucket
//
//  Created by Bezaleel Ashefor on 09/12/2023.
//

import SwiftUI
import Drops

enum MATCH_TYPE : Int, Equatable{
    case FIRSTROUND = 0
    case SECONDROUND = 1
    case THIRDROUND = 2
    case FOURTHROUND = 3
    case FINALROUND = 4
}

struct Standings: View {
    @State var showSettings = false
    @State var matches = [Match]()
    @State var secondRoundMatches = [Match]()
    @State var thirdRoundMatches = [Match]()
    @State var fourthRoundMatches = [Match]()
    @State var finalRoundMatches = [Match]()
    
    var playerViewModel = PlayersViewModel()
    var matchViewModel = MatchViewModel()
    
    @State var headliner : String = ""
    @State var showLoader : Bool = false
    @ObservedObject var viewObserver : ViewObserver
    @State var loaderCount : Int = 0
    //@Binding var singleMatch : Match
    @State var showScoreView = false
    
    
    let columns = [
        GridItem(.flexible(), spacing: 12),
        GridItem(.flexible(), spacing: 12),
        GridItem(.flexible(), spacing: 12),
        GridItem(.flexible(), spacing: 12)
    ]
    
    let fourthColumns = [
        GridItem(.flexible(), spacing: 12),
        GridItem(.flexible(), spacing: 12)
    ]
    
    let finalColumns = [
        GridItem(.flexible(), spacing: 12),
    ]
    
    var body: some View {
        VStack{
            ZStack(alignment: .top){
                if (!matches.isEmpty){
                    ScrollView(showsIndicators: false){
                        LazyVGrid(columns: columns, spacing: 12) {
                            ForEach($matches, id: \.id) { $match in
                                SingleStanding(match: $match)
//                                    .onTapGesture {
//                                    if (match.seeded){
//                                        //singleMatch = match
//                                        //showScoreView.toggle()
//                                    }
//                                }
                            }
                        }.padding(.bottom, 20).padding(.top, 120).padding(.horizontal, 15)
                        SettingsDivider().frame(maxWidth: 400)
                        LazyVGrid(columns: columns, spacing: 12) {
                            ForEach($secondRoundMatches, id: \.id) { match in
                                SingleStanding(match: match)
                            }
                        }.padding(.bottom, 20).padding(.top, 20).padding(.horizontal, 15)
                        SettingsDivider().frame(maxWidth: 400)
                        LazyVGrid(columns: columns, spacing: 12) {
                            ForEach($thirdRoundMatches, id: \.id) { match in
                                SingleStanding(match: match)
                            }
                        }.padding(.bottom, 20).padding(.top, 20).padding(.horizontal, 15)
                        SettingsDivider().frame(maxWidth: 400)
                        LazyVGrid(columns: fourthColumns, spacing: 12) {
                            ForEach($fourthRoundMatches, id: \.id) { match in
                                SingleStanding(match: match)
                            }
                        }.padding(.bottom, 20).padding(.top, 20).padding(.horizontal, 15)
                        SettingsDivider().frame(maxWidth: 400)
                        LazyVGrid(columns: finalColumns, spacing: 12) {
                            ForEach($finalRoundMatches, id: \.id) { match in
                                SingleStanding(match: match)
                            }
                        }.padding(.bottom, 120).padding(.top, 20).padding(.horizontal, 15).frame(maxWidth: 500)
                    }.ignoresSafeArea()
                }
                VStack{
                    HStack(alignment: .center){
                        Text("Standings\(headliner)").font(.custom(FontsManager.Bold, size: 20))
                        Spacer()
                        Button(action: {
                            showSettings.toggle()
                        }){
                            Image(systemName: "slider.horizontal.3").font(.system(size: 22, weight: .medium)).foregroundStyle(Color.label)
                        }
                    }.padding(.top, 20).padding(.bottom, 15).padding(.horizontal, 30).background(.ultraThinMaterial)
                    if (matches.isEmpty && !showLoader){
                        EmptyView(message: "There are no matches yet. \nStart the seeding to generate matches", button: "Seed", showButton: true, action: {
                            startSeeding()
                        })
                    }
                    if (showLoader){
                        LoaderView(message: ["Fetching Players", "Seeding Matches", "Rounding Up"], loaderCount: $loaderCount)
                    }
                }
            }
        }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .leading).sheet(isPresented: $showSettings){
            Settings(viewObserver: viewObserver)
        }.onChange(of: viewObserver.clearMatches, perform: { value in
            if (value){
                matches = [Match]()
                secondRoundMatches = [Match]()
                thirdRoundMatches = [Match]()
                fourthRoundMatches = [Match]()
                finalRoundMatches = [Match]()
            }
        })
//        .sheet(isPresented: $showScoreView){
//            ScoreView(match: $singleMatch)//.interactiveDismissDisabled()
//        }
    }
    
    func startSeeding(){
        var players = playerViewModel.fetchPlayers()
        if (players.isEmpty){
            let drop = Drop(title: "No players added yet")
            Drops.show(drop)
        } else {
            showLoader = true
            DispatchQueue.global(qos: .background).asyncAfter(deadline: .now() + 0.7){
                loaderCount += 1
                DispatchQueue.global(qos: .background).asyncAfter(deadline: .now() + 0.7){
                    loaderCount += 1
                    players.shuffle()
                    var matches = [Match]()
                    var secondRoundMatches = [Match]()
                    var thirdRoundMatches = [Match]()
                    var fourthRoundMatches = [Match]()
                    var finalRoundMatches = [Match]()
                    
                    let newPlayersDeck = players.split()
                    let leftSide : [Player] = newPlayersDeck.left
                    let rightSide : [Player] = newPlayersDeck.right
                    
                    for index in leftSide.indices {
                        matches.append(Match(firstPlayer: leftSide[index].id!,
                                             secondPlayer: rightSide[index].id!,
                                             firstPlayerName: leftSide[index].name,
                                             secondPlayerName: rightSide[index].name,
                                             firstPlayerScore: 0,
                                             secondPlayerScore: 0,
                                             stage: .FIRSTROUND,
                                             seeded: true))
                    }
                    
                    
                    for _ in (0 ..< 8) {
                        secondRoundMatches.append(Match(firstPlayer: UUID(),
                                                        secondPlayer: UUID(),
                                                        firstPlayerName: "-",
                                                        secondPlayerName: "-",
                                                        firstPlayerScore: 0,
                                                        secondPlayerScore: 0,
                                                        stage: .SECONDROUND,
                                                        seeded: false))
                    }
                    
                    
                    for _ in (0 ..< 4) {
                        thirdRoundMatches.append(Match(firstPlayer: UUID(),
                                                       secondPlayer: UUID(),
                                                       firstPlayerName: "-",
                                                       secondPlayerName: "-",
                                                       firstPlayerScore: 0,
                                                       secondPlayerScore: 0,
                                                       stage: .SECONDROUND,
                                                       seeded: false))
                    }
                    
                    for _ in (0 ..< 2) {
                        fourthRoundMatches.append(Match(firstPlayer: UUID(),
                                                        secondPlayer: UUID(),
                                                        firstPlayerName: "-",
                                                        secondPlayerName: "-",
                                                        firstPlayerScore: 0,
                                                        secondPlayerScore: 0,
                                                        stage: .SECONDROUND,
                                                        seeded: false))
                    }
                    
                    for _ in (0 ..< 1) {
                        finalRoundMatches.append(Match(firstPlayer: UUID(),
                                                       secondPlayer: UUID(),
                                                       firstPlayerName: "-",
                                                       secondPlayerName: "-",
                                                       firstPlayerScore: 0,
                                                       secondPlayerScore: 0,
                                                       stage: .SECONDROUND,
                                                       seeded: false))
                    }
                    
                    self.finalRoundMatches = finalRoundMatches
                    self.fourthRoundMatches = fourthRoundMatches
                    self.thirdRoundMatches = thirdRoundMatches
                    self.secondRoundMatches = secondRoundMatches
                    self.matches = matches
                    showLoader = false
                    loaderCount = 0
                }
            }
        }
    }
}

#Preview {
    Standings(viewObserver: ViewObserver())
}
