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
    @Binding var nextRoundMatches : [Match]
    @State var showScoreView = false
    
    var body: some View {
        HStack(spacing: 10){
            VStack(alignment: .leading, spacing: 0){
                Text(match.firstPlayerName.replacingOccurrences(of: " ", with: "\n")).lineLimit(/*@START_MENU_TOKEN@*/2/*@END_MENU_TOKEN@*/, reservesSpace: true)
                Text(String(format: "%02d", match.firstPlayerScore)).font(.custom(FontsManager.Black, size: blockSize))
            }.frame(minWidth: 0, maxWidth: .infinity, alignment: .leading).padding(.bottom, -10)
            ZStack(alignment: .center){
                Circle().stroke(lineWidth: 1)
                Text("VS")
            }.frame(width: 36, height: 36)
            VStack(alignment: .trailing, spacing: 0){
                Text(match.secondPlayerName.replacingOccurrences(of: " ", with: "\n")).multilineTextAlignment(.trailing).lineLimit(/*@START_MENU_TOKEN@*/2/*@END_MENU_TOKEN@*/, reservesSpace: true)
                Text(String(format: "%02d", match.secondPlayerScore)).font(.custom(FontsManager.Black, size: blockSize))
            }.frame(minWidth: 0, maxWidth: .infinity, alignment: .trailing).padding(.bottom, -10)
        }.padding(13).background(Color("SingleBg"))
            .clipShape(RoundedRectangle(cornerRadius: 15))
            .shadow(color: Color.black.opacity(0.1), radius: 5)
            .font(.custom(FontsManager.Regular, size: 16))
            .opacity(match.ended ? 0.68 : 1)
            .overlay(
                RoundedRectangle(cornerRadius: 15)
                    .stroke(match.ended ? Color.accentColor.opacity(0.5) : Color.clear, lineWidth: 1)
            )
            .sheet(isPresented: $showScoreView){
                ScoreView(match: $match, nextRoundMatches: $nextRoundMatches)//.interactiveDismissDisabled()
            }.onTapGesture {
                if (match.seeded && !match.ended){
                    showScoreView.toggle()
                }
            }
    }
}

#Preview {
    SingleStanding(match: .constant(Match(firstPlayer: UUID(), secondPlayer: UUID(), firstPlayerName: "Pauline Lino", secondPlayerName: "Amos Tobi",  firstPlayerScore: 99,  secondPlayerScore: 67,  firstThreePoint: 0,
                                          secondThreePoint: 0,
                                          firstTwoPoint: 0,
                                          secondTwoPoint: 0,
                                          firstFoulPoint: 0,
                                          secondFoulPoint: 0,
                                          firstBlockPoint: 0,
                                          secondBlockPoint: 0,
                                          stage: .FIRSTROUND, seeded: true, seedPosition: 1, ended: false)), nextRoundMatches: .constant([])).frame(maxWidth: 400)
}
