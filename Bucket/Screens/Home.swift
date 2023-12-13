//
//  Home.swift
//  Bucket
//
//  Created by Bezaleel Ashefor on 04/12/2023.
//

import SwiftUI

enum CURRENT_SCREEN {
  case STANDINGS, STATS, PLAYERS
}

struct Home: View {
    @State var currentScreen : CURRENT_SCREEN = .STANDINGS
    @StateObject var viewObserver = ViewObserver()
    @State var singleMatch : Match = Match(firstPlayer: UUID(), secondPlayer: UUID(), firstPlayerName: "Pauline Lino", secondPlayerName: "Amos Tobi", firstPlayerScore: 99,  secondPlayerScore: 67, stage: .FIRSTROUND, seeded: true)
    
    var body: some View {
        ZStack(alignment: .bottom){
            if (currentScreen == .STANDINGS){
                Standings(viewObserver: viewObserver)
            } else if (currentScreen == .STATS){
                Stats(viewObserver: viewObserver)
            } else {
                Players(viewObserver: viewObserver)
            }
            BottomNavBar(currentScreen: $currentScreen)
        }.background(Color("HomeBg"))
    }
}

#Preview {
    Home()
}


class HomeHostingController: UIHostingController<Home> {
    
    @objc required dynamic init?(coder: NSCoder) {
        super.init(coder: coder, rootView: Home())
    }
    
}
