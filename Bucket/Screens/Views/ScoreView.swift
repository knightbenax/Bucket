//
//  ScoreView.swift
//  Bucket
//
//  Created by Bezaleel Ashefor on 13/12/2023.
//

import SwiftUI

struct ScoreView: View {
    @Binding var match : Match
    var blockSize : CGFloat = 85
    
    
    var body: some View {
        VStack{
            HStack(spacing: 10){
                VStack(alignment: .leading, spacing: 10){
                    Text(match.firstPlayerName)
                    HStack(alignment: .center, spacing: 20){
                        Text("\(match.firstPlayerScore)").font(.custom(FontsManager.Black, size: blockSize)).padding(.bottom, 5)
                        VStack(spacing: 15){
                            Button(action: {
                                increaseScore(who: "first")
                            }){
                                Image(systemName: "chevron.up")
                                    .font(.system(size: 20, weight: .medium))
                                    .foregroundStyle(Color("ScoreBtnBg")).padding(10).background(Color.label).clipShape(RoundedRectangle(cornerRadius: 5)).contentShape(Rectangle())
                            }
                            Button(action: {
                                reduceScore(who: "first")
                            }){
                                Image(systemName: "chevron.down")
                                    .font(.system(size: 20, weight: .medium))
                                    .foregroundStyle(Color("ScoreBtnBg")).padding(10).background(Color.label).clipShape(RoundedRectangle(cornerRadius: 5)).contentShape(Rectangle())
                            }
                        }
                    }
                }.frame(minWidth: 0, maxWidth: .infinity, alignment: .leading).padding(.bottom, -10)
                ZStack(alignment: .center){
                    Circle().stroke(lineWidth: 1)
                    Text("VS")
                }.frame(width: 36, height: 36)
                VStack(alignment: .trailing, spacing: 10){
                    Text(match.secondPlayerName).multilineTextAlignment(.trailing)
                    HStack(alignment: .center, spacing: 20){
                        Text("\(match.secondPlayerScore)").font(.custom(FontsManager.Black, size: blockSize)).padding(.bottom, 5)
                        VStack(spacing: 15){
                            Button(action: {
                                increaseScore(who: "second")
                            }){
                                Image(systemName: "chevron.up")
                                    .font(.system(size: 20, weight: .medium))
                                    .foregroundStyle(Color("ScoreBtnBg")).padding(10).background(Color.label).clipShape(RoundedRectangle(cornerRadius: 5)).contentShape(Rectangle())
                            }
                            Button(action: {
                                reduceScore(who: "second")
                            }){
                                Image(systemName: "chevron.down")
                                    .font(.system(size: 20, weight: .medium))
                                    .foregroundStyle(Color("ScoreBtnBg")).padding(10).background(Color.label).clipShape(RoundedRectangle(cornerRadius: 5)).contentShape(Rectangle())
                            }
                        }
                    }
                }.frame(minWidth: 0, maxWidth: .infinity, alignment: .trailing).padding(.bottom, -10)
            }
            Spacer()
        }.padding(.horizontal, 50)
            .padding(.vertical, 30)
            .background(Color("SingleBg"))
            .font(.custom(FontsManager.Regular, size: 16))
            
    }
    
    func increaseScore(who: String){
        if (who == "first"){
            match.firstPlayerScore += 1
        } else {
            match.secondPlayerScore += 1
        }
    }
    
    func reduceScore(who: String) {
        if (who == "first"){
            if (match.firstPlayerScore > 0){
                match.firstPlayerScore -= 1
            }
        } else {
            if (match.secondPlayerScore > 0){
                match.secondPlayerScore -= 1
            }
        }
    }
}

#Preview {
    ScoreView(match: .constant(Match(firstPlayer: UUID(), secondPlayer: UUID(), firstPlayerName: "Pauline Lino", secondPlayerName: "Amos Tobi",  firstPlayerScore: 99,  secondPlayerScore: 67, stage: .FIRSTROUND, seeded: true))).frame(maxWidth: 900)
}
