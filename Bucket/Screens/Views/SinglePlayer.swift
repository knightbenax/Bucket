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
    @Environment(\.colorScheme) var colorScheme

    var body: some View {
        HStack(alignment: .center, spacing: 10){
            VStack(alignment: .leading, spacing: 0){
                Text(player.name.capitalized).font(.custom(FontsManager.Regular, size: 18)).lineLimit(2, reservesSpace: true)
            }
            VStack(alignment: .trailing, spacing: 0){
                Text("0").font(.custom(FontsManager.Black, size: blockSize))
            }.frame(minWidth: 0, maxWidth: .infinity, alignment: .trailing).padding(.bottom, 5)
        }.padding(15).background(Color("SingleBg")).clipShape(RoundedRectangle(cornerRadius: 15)).shadow(color: Color.black.opacity(colorScheme == .light ? 0.1 : 0.3), radius: 5).font(.custom(FontsManager.Regular, size: 16))
    }
}

#Preview {
    SinglePlayer(player: .constant(Player(name: "Bolakale Yusuf Adedayo", dob: "21/10/2003", address: "Block 753 flat 6 abesan estate ipaja", phone: 8148807690, email: "allisonisreal46@gmail.com"))).frame(maxWidth: 400)
}
