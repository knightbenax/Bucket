//
//  BottomNavBar.swift
//  Bucket
//
//  Created by Bezaleel Ashefor on 08/12/2023.
//

import SwiftUI

struct BottomNavBar: View {
    var verticalPadding : CGFloat = 12
    var topPadding : CGFloat = 0.5
    @Binding var currentScreen : CURRENT_SCREEN
    @State var offsetValue : CGFloat = -(420 / 3)
    var barWidth : CGFloat = 420
    var pillWidth : CGFloat = 30
    var blendDuration : CGFloat = 5
    var dampFraction: CGFloat = 0.55
    var response : CGFloat = 0.2
    
    var body: some View {
        ZStack(alignment: .top){
            
            HStack(spacing: 0){
                Button(action: {
                    currentScreen = .STANDINGS
                    withAnimation(.spring (response: response, dampingFraction:  dampFraction, blendDuration: blendDuration)){
                        offsetValue = -(barWidth / 3)
                    }
                }){
                    HStack{
                        Spacer()
                        Text("Standings")
                        Spacer()
                    }.contentShape(Rectangle())
                }.frame(minWidth: 0, maxWidth: .infinity, alignment: .center).padding(.vertical, verticalPadding).padding(.top, topPadding).padding(.horizontal)//.background(Color.blue)
                Button(action: {
                    currentScreen = .STATS
                    withAnimation(.spring (response: response, dampingFraction:  dampFraction, blendDuration: blendDuration)){
                        offsetValue = 0
                    }
                }){
                    HStack{
                        Spacer()
                        Text("Stats")
                        Spacer()
                    }.contentShape(Rectangle())
                }.frame(minWidth: 0, maxWidth: .infinity, alignment: .center).padding(.vertical, verticalPadding).padding(.top, topPadding).padding(.horizontal)//.background(Color.yellow)
                Button(action: {
                    currentScreen = .PLAYERS
                    withAnimation(.spring (response: response, dampingFraction:  dampFraction, blendDuration: blendDuration)){
                        offsetValue = (barWidth / 3)
                    }
                }){
                    HStack{
                        Spacer()
                        Text("Players")
                        Spacer()
                    }.contentShape(Rectangle())
                }.frame(minWidth: 0, maxWidth: .infinity, alignment: .center).padding(.vertical, verticalPadding).padding(.top, topPadding).padding(.horizontal)
            }.background(.ultraThinMaterial).foregroundStyle(Color.label).overlay(
                RoundedRectangle(cornerRadius: 30)
                    .stroke(Color.label.opacity(0.5), lineWidth: 0.2)
            ).clipShape(RoundedRectangle(cornerRadius: 30)).shadow(color: Color.black.opacity(0.05), radius: 10)
            HStack{
                
            }.frame(width: pillWidth, height: 4.7)
                .background(Color.label)
                .clipShape(RoundedRectangle(cornerRadius: 4, style: .continuous))
                .offset(x: offsetValue)
        }.padding(.bottom, 15).frame(width: barWidth).font(.custom(FontsManager.Regular, size: 16))
    }
}

#Preview {
    BottomNavBar(currentScreen: .constant(.STANDINGS))
}
