//
//  SingleStat.swift
//  Bucket
//
//  Created by Bezaleel Ashefor on 14/12/2023.
//

import SwiftUI

struct SingleStat: View {
    @Binding var stat : Stat
    @Environment(\.colorScheme) var colorScheme
    var blockSize : CGFloat = 55
    
    var body: some View {
        VStack(spacing: 15){
            HStack(alignment: .center, spacing: 10){
                VStack(alignment: .leading, spacing: 0){
                    Text(stat.ownerName.replacingOccurrences(of: " ", with: "\n").capitalized).font(.custom(FontsManager.Regular, size: 18)).lineLimit(2, reservesSpace: true)
                }
                Spacer()
                VStack(alignment: .trailing, spacing: 0){
                    Text("\(stat.value)").font(.custom(FontsManager.Black, size: blockSize))
                }.frame(minWidth: 0, maxWidth: .infinity, alignment: .trailing).padding(.bottom, 5)
            }
        }.padding(15).background(Color("SingleBg"))
            .clipShape(RoundedRectangle(cornerRadius: 15))
            .shadow(color: Color.black.opacity(colorScheme == .light ? 0.1 : 0.3), radius: 5)
            .font(.custom(FontsManager.Regular, size: 16))
    }
}

#Preview {
    SingleStat(stat: .constant(Stat(ownerName: "Anoti", value: 59, type: .SCORE, owner: UUID())))
}
