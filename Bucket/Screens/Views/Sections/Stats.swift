//
//  Stats.swift
//  Bucket
//
//  Created by Bezaleel Ashefor on 09/12/2023.
//

import SwiftUI

struct Stats: View {
    @State var showSettings = false
    @State var stats = [Stat]()
    @State var headliner : String = ""
    
    var body: some View {
        VStack{
            HStack{
                Text("Stats\(headliner)").font(.custom(FontsManager.Bold, size: 20))
                Spacer()
                Button(action: {
                    showSettings.toggle()
                }){
                    Image(systemName: "slider.horizontal.3").font(.system(size: 22, weight: .medium)).foregroundStyle(Color.label)
                }
            }
            VStack{
                if (stats.isEmpty){
                    EmptyView(message: "There are no stats yet. \nOnce games start, stats show up here", showButton: false)
                } else {
                    
                }
            }
            Spacer()
        }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .leading).padding(30).sheet(isPresented: $showSettings){
            Settings()
        }
    }
}

#Preview {
    Stats()
}
