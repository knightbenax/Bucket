//
//  Standings.swift
//  Bucket
//
//  Created by Bezaleel Ashefor on 09/12/2023.
//

import SwiftUI

struct Standings: View {
    @State var showSettings = false
    @State var matches = [Match]()
    var playerViewModel = PlayersViewModel()
    
    var body: some View {
        VStack{
            HStack(alignment: .center){
                Text("Standings - 32 Players. 10 Remaining").font(.custom(FontsManager.Bold, size: 20))
                Spacer()
                Button(action: {
                    showSettings.toggle()
                }){
                    Image(systemName: "slider.horizontal.3").font(.system(size: 22, weight: .medium)).foregroundStyle(Color.label)
                }
            }
            VStack{
                if (matches.isEmpty){
                    EmptyView(message: "There are no matches yet. \nStart the seeding to generate matches", button: "Seed", showButton: true)
                } else {
                    
                }
            }
            Spacer()
        }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .leading).padding(30).sheet(isPresented: $showSettings){
            Settings()
        }
    }
    
    func startSeeding(){
        
    }
}

#Preview {
    Standings()
}
