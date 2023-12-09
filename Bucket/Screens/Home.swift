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
    
    var body: some View {
        ZStack(alignment: .bottom){
            if (currentScreen == .STANDINGS){
                Standings()
            } else if (currentScreen == .STATS){
                Stats()
            } else {
                Players()
            }
            BottomNavBar(currentScreen: $currentScreen)
        }.background(Color("HomeBg"))
    }
}

#Preview {
    Home()
}
