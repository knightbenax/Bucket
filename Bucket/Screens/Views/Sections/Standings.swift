//
//  Standings.swift
//  Bucket
//
//  Created by Bezaleel Ashefor on 09/12/2023.
//

import SwiftUI

struct Standings: View {
    var body: some View {
        VStack{
            HStack(alignment: .center){
                Text("Standings - 32 Players. 10 Remaining").font(.custom(FontsManager.Bold, size: 20))
                Spacer()
                Button(action: {
                    
                }){
                    Image(systemName: "slider.horizontal.3").font(.system(size: 22, weight: .medium))
                }
            }
            Spacer()
        }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .leading).padding(30)
    }
}

#Preview {
    Standings()
}
