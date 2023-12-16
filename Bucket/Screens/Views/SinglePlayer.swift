//
//  SinglePlayer.swift
//  Bucket
//
//  Created by Bezaleel Ashefor on 11/12/2023.
//

import SwiftUI

struct SinglePlayer: View {
    var blockSize : CGFloat = 55
    @Binding var player : Player
    @State var matches = [Match]()
    @Environment(\.colorScheme) var colorScheme

    var body: some View {
        VStack(spacing: 15){
            HStack(alignment: .center, spacing: 10){
                VStack(alignment: .leading, spacing: 0){
                    Text(player.name.replacingOccurrences(of: " ", with: "\n").capitalized).font(.custom(FontsManager.Regular, size: 18)).lineLimit(2, reservesSpace: true)
                }
                Spacer()
                VStack(alignment: .trailing, spacing: 0){
                    Text("\(getTotalPoints())").font(.custom(FontsManager.Black, size: blockSize))
                }.frame(minWidth: 0, maxWidth: .infinity, alignment: .trailing).padding(.bottom, 5)
            }
            SettingsDivider()
            HStack{
                Text("\(getThreePoints()) Two Points").frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                Spacer().frame(width: 60)
                Text("\(getTwoPoints()) One Point").frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                Text("\(getBlocks()) Blocks").frame(minWidth: 0, maxWidth: .infinity, alignment: .trailing)
                Text("\(getFouls()) Fouls").frame(minWidth: 0, maxWidth: .infinity, alignment: .trailing)
            }
        }.padding(15).background(Color("SingleBg")).clipShape(RoundedRectangle(cornerRadius: 15)).shadow(color: Color.black.opacity(colorScheme == .light ? 0.1 : 0.3), radius: 5).font(.custom(FontsManager.Regular, size: 16))
    }
    
    func getThreePoints() -> Int {
        var value = 0
        for match in matches {
            if (match.firstPlayer == player.id){
                value = value + match.firstThreePoint
            } else if (match.secondPlayer == player.id) {
                value = value + match.secondThreePoint
            }
        }
        return value
    }
    
    func getTotalPoints() -> Int {
        var value = 0
        for match in matches {
            if (match.firstPlayer == player.id){
                value = value + match.firstPlayerScore
            } else if (match.secondPlayer == player.id) {
                value = value + match.secondPlayerScore
            }
        }
        return value
    }
    
    func getTwoPoints() -> Int {
        var value = 0
        for match in matches {
            if (match.firstPlayer == player.id){
                value = value + match.firstTwoPoint
            } else if (match.secondPlayer == player.id) {
                value = value + match.secondTwoPoint
            }
        }
        return value
    }
    
    func getBlocks() -> Int {
        var value = 0
        for match in matches {
            if (match.firstPlayer == player.id){
                value = value + match.firstBlockPoint
            } else if (match.secondPlayer == player.id) {
                value = value + match.secondBlockPoint
            }
        }
        return value
    }
    
    func getFouls() -> Int {
        var value = 0
        for match in matches {
            if (match.firstPlayer == player.id){
                value = value + match.firstFoulPoint
            } else if (match.secondPlayer == player.id) {
                value = value + match.secondFoulPoint
            }
        }
        return value
    }
}

#Preview {
    SinglePlayer(player: .constant(Player(name: "Bolakale Yusuf Adedayo", dob: "21/10/2003", address: "Block 753 flat 6 abesan estate ipaja", phone: 8148807690, email: "allisonisreal46@gmail.com"))).frame(maxWidth: 400)
}
