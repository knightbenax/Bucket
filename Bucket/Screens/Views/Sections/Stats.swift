//
//  Stats.swift
//  Bucket
//
//  Created by Bezaleel Ashefor on 09/12/2023.
//

import SwiftUI

enum STAT_TYPE : Int, Equatable{
    case THREEPOINT = 0
    case TWOPOINT = 1
    case BLOCKS = 2
    case FOUL = 3
}

struct Stats: View {
    @State var showSettings = false
    @State var stats = [Stat]()
    @State var headliner : String = ""
    @ObservedObject var viewObserver : ViewObserver
    
    var body: some View {
        ZStack(alignment: .top){
            VStack{
                HStack{
                    Text("Stats\(headliner)").font(.custom(FontsManager.Bold, size: 20))
                    Spacer()
                    Button(action: {
                        showSettings.toggle()
                    }){
                        Image(systemName: "slider.horizontal.3").font(.system(size: 22, weight: .medium)).foregroundStyle(Color.label)
                    }
                }.padding(.top, 20).padding(.bottom, 15).padding(.horizontal, 30).background(.ultraThinMaterial)
                if (stats.isEmpty){
                    EmptyView(message: "There are no stats yet. \nOnce games start, stats show up here", showButton: false)
                }
            }
        }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .leading).sheet(isPresented: $showSettings){
            Settings(viewObserver: viewObserver)
        }
    }
}

#Preview {
    Stats(viewObserver: ViewObserver())
}
