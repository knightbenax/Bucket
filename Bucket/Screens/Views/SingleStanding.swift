//
//  Standing.swift
//  Bucket
//
//  Created by Bezaleel Ashefor on 04/12/2023.
//

import SwiftUI

struct SingleStanding: View {
    var blockSize : CGFloat = 45
    @Binding var match : Match
    @State var showScoreView = false

    var body: some View {
        HStack(spacing: 10){
            VStack(alignment: .leading, spacing: 0){
                Text(match.firstPlayerName.replacingOccurrences(of: " ", with: "\n")).lineLimit(/*@START_MENU_TOKEN@*/2/*@END_MENU_TOKEN@*/, reservesSpace: true)
                Text("\(match.firstPlayerScore)").font(.custom(FontsManager.Black, size: blockSize))
            }.frame(minWidth: 0, maxWidth: .infinity, alignment: .leading).padding(.bottom, -10)
            ZStack(alignment: .center){
                Circle().stroke(lineWidth: 1)
                Text("VS")
            }.frame(width: 36, height: 36)
            VStack(alignment: .trailing, spacing: 0){
                Text(match.secondPlayerName.replacingOccurrences(of: " ", with: "\n")).multilineTextAlignment(.trailing).lineLimit(/*@START_MENU_TOKEN@*/2/*@END_MENU_TOKEN@*/, reservesSpace: true)
                Text("\(match.secondPlayerScore)").font(.custom(FontsManager.Black, size: blockSize))
            }.frame(minWidth: 0, maxWidth: .infinity, alignment: .trailing).padding(.bottom, -10)
        }.padding(13).background(Color("SingleBg")).clipShape(RoundedRectangle(cornerRadius: 15)).shadow(color: Color.black.opacity(0.1), radius: 5).font(.custom(FontsManager.Regular, size: 16)).sheet(isPresented: $showScoreView){
            ScoreView(match: $match)//.interactiveDismissDisabled()
        }.onTapGesture {
            showScoreView.toggle()
        }
    }
}

#Preview {
    SingleStanding(match: .constant(Match(firstPlayer: UUID(), secondPlayer: UUID(), firstPlayerName: "Pauline Lino", secondPlayerName: "Amos Tobi",  firstPlayerScore: 99,  secondPlayerScore: 67, stage: .FIRSTROUND, seeded: true))).frame(maxWidth: 400)
}
