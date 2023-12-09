//
//  Players.swift
//  Bucket
//
//  Created by Bezaleel Ashefor on 09/12/2023.
//

import SwiftUI

struct Players: View {
    var body: some View {
        VStack{
            Text("Players - 32 Players. 10 Remaining").font(.custom(FontsManager.Bold, size: 20))
            Spacer()
        }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .leading).padding(30)
    }
}

#Preview {
    Players()
}
