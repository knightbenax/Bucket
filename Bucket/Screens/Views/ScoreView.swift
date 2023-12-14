//
//  ScoreView.swift
//  Bucket
//
//  Created by Bezaleel Ashefor on 13/12/2023.
//

import SwiftUI
import Drops

struct ScoreView: View {
    @Binding var match : Match
    @Binding var nextRoundMatches : [Match]
    var blockSize : CGFloat = 85
    var blockSizeSmall : CGFloat = 45
    var statTextSize : CGFloat = 65
    @State var showingAlertFinish : Bool = false
    @Environment(\.presentationMode) var presentationMode
    var matchesViewModel = MatchViewModel()
    
    
    var body: some View {
        VStack{
            Spacer()
            HStack(spacing: 10){
                VStack(alignment: .leading, spacing: 10){
                    Text(match.firstPlayerName)
                    HStack(alignment: .center, spacing: 20){
                        Text(String(format: "%02d", match.firstPlayerScore)).font(.custom(FontsManager.Black, size: blockSize)).padding(.bottom, 5).frame(minWidth: 110)
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
                        Text(String(format: "%02d", match.secondPlayerScore)).font(.custom(FontsManager.Black, size: blockSize)).padding(.bottom, 5)
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
            Spacer().frame(height: 70)
            HStack{
                VStack{
                    HStack(alignment: .center, spacing: 15){
                        Button(action: {
                            increaseThree(who: "first")
                        }){
                            Image(systemName: "plus")
                                .font(.system(size: 20, weight: .medium))
                                .foregroundStyle(Color("ScoreBtnBg")).padding(10).background(Color.label).clipShape(RoundedRectangle(cornerRadius: 5)).contentShape(Rectangle())
                        }
                        Spacer()
                        VStack(spacing: 0){
                            Text(String(format: "%02d", match.firstThreePoint)).font(.custom(FontsManager.Black, size: blockSizeSmall))
                            Text("3-points").frame(minWidth: statTextSize)
                        }
                        Spacer()
                        Button(action: {
                            reduceThree(who: "first")
                        }){
                            Image(systemName: "minus")
                                .font(.system(size: 20, weight: .medium))
                                .foregroundStyle(Color("ScoreBtnBg")).padding(10).padding(.vertical, 7).background(Color.label).clipShape(RoundedRectangle(cornerRadius: 5)).contentShape(Rectangle())
                        }
                    }
                    HStack(alignment: .center, spacing: 15){
                        Button(action: {
                            increaseTwo(who: "first")
                        }){
                            Image(systemName: "plus")
                                .font(.system(size: 20, weight: .medium))
                                .foregroundStyle(Color("ScoreBtnBg")).padding(10).background(Color.label).clipShape(RoundedRectangle(cornerRadius: 5)).contentShape(Rectangle())
                        }
                        Spacer()
                        VStack(spacing: 0){
                            Text(String(format: "%02d", match.firstTwoPoint)).font(.custom(FontsManager.Black, size: blockSizeSmall))
                            Text("2-points").frame(minWidth: statTextSize)
                        }
                        Spacer()
                        Button(action: {
                            reduceTwo(who: "first")
                        }){
                            Image(systemName: "minus")
                                .font(.system(size: 20, weight: .medium))
                                .foregroundStyle(Color("ScoreBtnBg")).padding(10).padding(.vertical, 7).background(Color.label).clipShape(RoundedRectangle(cornerRadius: 5)).contentShape(Rectangle())
                        }
                    }
                    HStack(spacing: 15){
                        Button(action: {
                            increaseBlock(who: "first")
                        }){
                            Image(systemName: "plus")
                                .font(.system(size: 20, weight: .medium))
                                .foregroundStyle(Color("ScoreBtnBg")).padding(10).background(Color.label).clipShape(RoundedRectangle(cornerRadius: 5)).contentShape(Rectangle())
                        }
                        Spacer()
                        VStack(spacing: 0){
                            Text(String(format: "%02d", match.firstBlockPoint)).font(.custom(FontsManager.Black, size: blockSizeSmall))
                            Text("Blocks").frame(minWidth: statTextSize)
                        }
                        Spacer()
                        Button(action: {
                            reduceBlock(who: "first")
                        }){
                            Image(systemName: "minus")
                                .font(.system(size: 20, weight: .medium))
                                .foregroundStyle(Color("ScoreBtnBg")).padding(10).padding(.vertical, 7).background(Color.label).clipShape(RoundedRectangle(cornerRadius: 5)).contentShape(Rectangle())
                        }
                    }
                    HStack(spacing: 15){
                        Button(action: {
                            increaseFoul(who: "first")
                        }){
                            Image(systemName: "plus")
                                .font(.system(size: 20, weight: .medium))
                                .foregroundStyle(Color("ScoreBtnBg")).padding(10).background(Color.label).clipShape(RoundedRectangle(cornerRadius: 5)).contentShape(Rectangle())
                        }
                        Spacer()
                        VStack(spacing: 0){
                            Text(String(format: "%02d", match.firstFoulPoint)).font(.custom(FontsManager.Black, size: blockSizeSmall))
                            Text("Fouls").frame(minWidth: statTextSize).multilineTextAlignment(.leading)
                        }
                        Spacer()
                        Button(action: {
                            reduceFoul(who: "first")
                        }){
                            Image(systemName: "minus")
                                .font(.system(size: 20, weight: .medium))
                                .foregroundStyle(Color("ScoreBtnBg")).padding(10).padding(.vertical, 7).background(Color.label).clipShape(RoundedRectangle(cornerRadius: 5)).contentShape(Rectangle())
                        }
                    }
                }.frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                Spacer().frame(minWidth: 20)
                VStack{
                    HStack(spacing: 15){
                        Button(action: {
                            increaseThree(who: "second")
                        }){
                            Image(systemName: "plus")
                                .font(.system(size: 20, weight: .medium))
                                .foregroundStyle(Color("ScoreBtnBg")).padding(10).background(Color.label).clipShape(RoundedRectangle(cornerRadius: 5)).contentShape(Rectangle())
                        }
                        Spacer()
                        VStack(spacing: 0){
                            Text(String(format: "%02d", match.secondThreePoint)).font(.custom(FontsManager.Black, size: blockSizeSmall))
                            Text("3-points").frame(minWidth: statTextSize)
                        }
                        Spacer()
                        Button(action: {
                            reduceThree(who: "second")
                        }){
                            Image(systemName: "minus")
                                .font(.system(size: 20, weight: .medium))
                                .foregroundStyle(Color("ScoreBtnBg")).padding(10).padding(.vertical, 7).background(Color.label).clipShape(RoundedRectangle(cornerRadius: 5)).contentShape(Rectangle())
                        }
                    }
                    HStack(spacing: 15){
                        Button(action: {
                            increaseTwo(who: "second")
                        }){
                            Image(systemName: "plus")
                                .font(.system(size: 20, weight: .medium))
                                .foregroundStyle(Color("ScoreBtnBg")).padding(10).background(Color.label).clipShape(RoundedRectangle(cornerRadius: 5)).contentShape(Rectangle())
                        }
                        Spacer()
                        VStack(spacing: 0){
                            Text(String(format: "%02d", match.secondTwoPoint)).font(.custom(FontsManager.Black, size: blockSizeSmall))
                            Text("2-points").frame(minWidth: statTextSize)
                        }
                        Spacer()
                        Button(action: {
                            reduceTwo(who: "second")
                        }){
                            Image(systemName: "minus")
                                .font(.system(size: 20, weight: .medium))
                                .foregroundStyle(Color("ScoreBtnBg")).padding(10).padding(.vertical, 7).background(Color.label).clipShape(RoundedRectangle(cornerRadius: 5)).contentShape(Rectangle())
                        }
                    }
                    HStack(spacing: 15){
                        Button(action: {
                            increaseBlock(who: "second")
                        }){
                            Image(systemName: "plus")
                                .font(.system(size: 20, weight: .medium))
                                .foregroundStyle(Color("ScoreBtnBg")).padding(10).background(Color.label).clipShape(RoundedRectangle(cornerRadius: 5)).contentShape(Rectangle())
                        }
                        Spacer()
                        VStack(spacing: 0){
                            Text(String(format: "%02d", match.secondBlockPoint)).font(.custom(FontsManager.Black, size: blockSizeSmall))
                            Text("Blocks").frame(minWidth: statTextSize)
                        }
                        Spacer()
                        Button(action: {
                            reduceBlock(who: "second")
                        }){
                            Image(systemName: "minus")
                                .font(.system(size: 20, weight: .medium))
                                .foregroundStyle(Color("ScoreBtnBg")).padding(10).padding(.vertical, 7).background(Color.label).clipShape(RoundedRectangle(cornerRadius: 5)).contentShape(Rectangle())
                        }
                    }
                    HStack(spacing: 15){
                        Button(action: {
                            increaseFoul(who: "second")
                        }){
                            Image(systemName: "plus")
                                .font(.system(size: 20, weight: .medium))
                                .foregroundStyle(Color("ScoreBtnBg")).padding(10).background(Color.label).clipShape(RoundedRectangle(cornerRadius: 5)).contentShape(Rectangle())
                        }
                        Spacer()
                        VStack(spacing: 0){
                            Text(String(format: "%02d", match.secondFoulPoint)).font(.custom(FontsManager.Black, size: blockSizeSmall))
                            Text("Fouls").frame(minWidth: statTextSize).multilineTextAlignment(.leading)
                        }
                        Spacer()
                        Button(action: {
                            reduceFoul(who: "second")
                        }){
                            Image(systemName: "minus")
                                .font(.system(size: 20, weight: .medium))
                                .foregroundStyle(Color("ScoreBtnBg")).padding(10).padding(.vertical, 7).background(Color.label).clipShape(RoundedRectangle(cornerRadius: 5)).contentShape(Rectangle())
                        }
                    }
                }.frame(minWidth: 0, maxWidth: .infinity, alignment: .trailing)
            }
            Spacer().frame(height: 70)
            HStack(alignment: .center){
                if (match.ended){
                    Text("Game Ended!").foregroundStyle(Color.white).font(.custom(FontsManager.Medium, size: 16))
                } else {
                    Button(action: {
                        showingAlertFinish = true
                    }){
                        HStack{
                            Text("Finish Game").foregroundStyle(Color.white).font(.custom(FontsManager.Medium, size: 16))
                        }.padding(.vertical, 12).padding(.horizontal, 45).contentShape(Rectangle())
                    }
                    .background(Color.accentColor)
                    .cornerRadius(30)
                }
            }
            Spacer()
        }.padding(.horizontal, 50)
            .padding(.vertical, 30)
            .background(Color("SingleBg"))
            .font(.custom(FontsManager.Regular, size: 16))
            .alert(isPresented: $showingAlertFinish) {
                Alert(
                    title: Text("Warning"),
                    message: Text("Are you sure this match has ended? It would seed the winner into the next round"),
                    primaryButton: .default(
                                    Text("Cancel"),
                                    action: {}
                                ),
                                secondaryButton: .destructive(
                                    Text("Finish"),
                                    action: {
                                        presentationMode.wrappedValue.dismiss()
                                        seedIntoNextRound()
                                    }
                                )
                )
            }
            
    }
    
    func seedIntoNextRound(){
        if (match.firstPlayerScore > match.secondPlayerScore){
            //firstPlayer is the winner
            match.ended = true
            let drop = Drop(title: "Match Ended")
            Drops.show(drop)
            matchesViewModel.editMatch(match: match)
            let nextStageMatch = nextRoundMatches.firstIndex(where: {$0.seeded == false})
            if (nextStageMatch != nil) {
                if (match.seedPosition == 2){
                    //var nextMatch = nextStageMatches.first!
                    nextRoundMatches[nextStageMatch!].firstPlayerName = match.firstPlayerName
                    nextRoundMatches[nextStageMatch!].firstPlayer = match.firstPlayer
                    if (nextRoundMatches[nextStageMatch!].firstPlayerName != "-" && nextRoundMatches[nextStageMatch!].secondPlayerName != "-"){
                        nextRoundMatches[nextStageMatch!].seeded = true
                        matchesViewModel.editMatch(match: nextRoundMatches[nextStageMatch!])
                    }
                } else if (match.seedPosition == 1){
                    //var nextMatch = nextStageMatches.first!
                    nextRoundMatches[nextStageMatch!].secondPlayerName = match.firstPlayerName
                    nextRoundMatches[nextStageMatch!].secondPlayer = match.firstPlayer
                    if (nextRoundMatches[nextStageMatch!].firstPlayerName != "-" && nextRoundMatches[nextStageMatch!].secondPlayerName != "-"){
                        nextRoundMatches[nextStageMatch!].seeded = true
                        matchesViewModel.editMatch(match: nextRoundMatches[nextStageMatch!])
                    }
                }
            }
        } else if (match.secondPlayerScore > match.firstPlayerScore){
            //secondPlayer is the winner
            match.ended = true
            let drop = Drop(title: "Match Ended")
            Drops.show(drop)
            matchesViewModel.editMatch(match: match)
            let nextStageMatch = nextRoundMatches.firstIndex(where: {$0.seeded == false}) //matchesViewModel.getUnseededMatches(stage: MATCH_TYPE(rawValue: nextStage)!, seeded: false)
            if (nextStageMatch != nil) {
                if (match.seedPosition == 2){
                    nextRoundMatches[nextStageMatch!].firstPlayerName = match.secondPlayerName
                    nextRoundMatches[nextStageMatch!].firstPlayer = match.secondPlayer
                    if (nextRoundMatches[nextStageMatch!].firstPlayerName != "-" && nextRoundMatches[nextStageMatch!].secondPlayerName != "-"){
                        nextRoundMatches[nextStageMatch!].seeded = true
                        matchesViewModel.editMatch(match: nextRoundMatches[nextStageMatch!])
                    }
                } else if (match.seedPosition == 1){
                    nextRoundMatches[nextStageMatch!].secondPlayerName = match.secondPlayerName
                    nextRoundMatches[nextStageMatch!].secondPlayer = match.secondPlayer
                    if (nextRoundMatches[nextStageMatch!].firstPlayerName != "-" && nextRoundMatches[nextStageMatch!].secondPlayerName != "-"){
                        nextRoundMatches[nextStageMatch!].seeded = true
                        matchesViewModel.editMatch(match: nextRoundMatches[nextStageMatch!])
                    }
                }
            }
        }
    }
    
    func increaseScore(who: String){
        if (!match.ended) {
            if (who == "first"){
                match.firstPlayerScore += 1
            } else {
                match.secondPlayerScore += 1
            }
            matchesViewModel.editMatch(match: match)
        }
    }
    
    func reduceScore(who: String) {
        if (!match.ended){
            if (who == "first"){
                if (match.firstPlayerScore > 0){
                    match.firstPlayerScore -= 1
                }
            } else {
                if (match.secondPlayerScore > 0){
                    match.secondPlayerScore -= 1
                }
            }
            matchesViewModel.editMatch(match: match)
        }
    }
    
    
    func increaseThree(who: String){
        if (!match.ended) {
            if (who == "first"){
                match.firstPlayerScore += 3
                match.firstThreePoint += 1
            } else {
                match.secondPlayerScore += 3
                match.secondThreePoint += 1
            }
            matchesViewModel.editMatch(match: match)
        }
      
    }
    
    func reduceThree(who: String){
        if (!match.ended) {
            if (who == "first"){
                if (match.firstPlayerScore > 3){
                    match.firstPlayerScore -= 3
                }
                if (match.firstThreePoint > 0){
                    match.firstThreePoint -= 1
                }
            } else {
                if (match.secondPlayerScore > 3){
                    match.secondPlayerScore -= 3
                }
                if (match.secondThreePoint > 0){
                    match.secondThreePoint -= 1
                }
            }
            matchesViewModel.editMatch(match: match)
        }
    }
    
    
    func increaseTwo(who: String){
        if (!match.ended) {
            if (who == "first"){
                match.firstPlayerScore += 2
                match.firstTwoPoint += 1
            } else {
                match.secondPlayerScore += 2
                match.secondTwoPoint += 1
            }
            matchesViewModel.editMatch(match: match)
        }
    }
    
    func reduceTwo(who: String){
        if (!match.ended) {
            if (who == "first"){
                if (match.firstPlayerScore > 2){
                    match.firstPlayerScore -= 2
                }
                if (match.firstTwoPoint > 0){
                    match.firstTwoPoint -= 1
                }
            } else {
                if (match.secondPlayerScore > 2){
                    match.secondPlayerScore -= 2
                }
                if (match.secondTwoPoint > 0){
                    match.secondTwoPoint -= 1
                }
            }
            matchesViewModel.editMatch(match: match)
        }
    }
    
    func increaseBlock(who: String){
        if (!match.ended) {
            if (who == "first"){
                match.firstBlockPoint += 1
            } else {
                match.secondBlockPoint += 1
            }
            matchesViewModel.editMatch(match: match)
        }
        
    }
    
    func reduceBlock(who: String){
        if (!match.ended) {
            if (who == "first"){
                if (match.firstBlockPoint > 0){
                    match.firstBlockPoint -= 1
                }
            } else {
                if (match.secondBlockPoint > 0){
                    match.secondBlockPoint -= 1
                }
            }
            matchesViewModel.editMatch(match: match)
        }
        
    }
    
    
    func increaseFoul(who: String){
        if (!match.ended) {
            if (who == "first"){
                match.firstFoulPoint += 1
            } else {
                match.secondFoulPoint += 1
            }
            matchesViewModel.editMatch(match: match)
        }
    }
    
    func reduceFoul(who: String){
        if (!match.ended) {
            if (who == "first"){
                if (match.firstFoulPoint > 0){
                    match.firstFoulPoint -= 1
                }
            } else {
                if (match.secondFoulPoint > 0){
                    match.secondFoulPoint -= 1
                }
            }
            matchesViewModel.editMatch(match: match)
        }
    }
}

#Preview {
    ScoreView(match: .constant(Match(firstPlayer: UUID(),
                                     secondPlayer: UUID(), 
                                     firstPlayerName: "Pauline Lino",
                                     secondPlayerName: "Amos Tobi",
                                     firstPlayerScore: 99,  
                                     secondPlayerScore: 67,
                                     firstThreePoint: 0,
                                     secondThreePoint: 0,
                                     firstTwoPoint: 0,
                                     secondTwoPoint: 0,
                                     firstFoulPoint: 0,
                                     secondFoulPoint: 0,
                                     firstBlockPoint: 0,
                                     secondBlockPoint: 0,
                                     stage: .FIRSTROUND, 
                                     seeded: true,
                                     seedPosition: 1,
                                     ended: false
                                    )),
              nextRoundMatches: .constant([])).frame(maxWidth: 900)
}
