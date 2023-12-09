//
//  BottomNavBar.swift
//  Bucket
//
//  Created by Bezaleel Ashefor on 08/12/2023.
//

import SwiftUI

struct BottomNavBar: View {
    var verticalPadding : CGFloat = 9
    var topPadding : CGFloat = 0.5
    @Binding var currentScreen : CURRENT_SCREEN
    
    var body: some View {
        ZStack(alignment: .top){
            
            HStack(spacing: 0){
                Button(action: {
                    currentScreen = .STANDINGS
                }){
                    Text("Standings")
                }.frame(minWidth: 0, maxWidth: .infinity, alignment: .center).padding(.vertical, verticalPadding).padding(.top, topPadding).padding(.horizontal).background(Color.blue)
                Button(action: {
                    currentScreen = .STATS
                }){
                    Text("Stats")
                }.frame(minWidth: 0, maxWidth: .infinity, alignment: .center).padding(.vertical, verticalPadding).padding(.top, topPadding).padding(.horizontal).background(Color.yellow)
                Button(action: {
                    currentScreen = .PLAYERS
                }){
                    Text("Players")
                }.frame(minWidth: 0, maxWidth: .infinity, alignment: .center).padding(.vertical, verticalPadding).padding(.top, topPadding).padding(.horizontal).background(Color.red)
            }.background(Color.gray.opacity(0.4)).clipShape(RoundedRectangle(cornerRadius: 30)).foregroundStyle(Color.black)
            HStack{
                
            }.frame(width: 30, height: 4.5).background(Color.black).clipShape(RoundedRectangle(cornerRadius: 4, style: .continuous))
        }.padding(.bottom, 10).frame(maxWidth: 400)
    }
}

#Preview {
    BottomNavBar(currentScreen: .constant(.STANDINGS))
}
