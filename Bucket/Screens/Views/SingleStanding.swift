//
//  Standing.swift
//  Bucket
//
//  Created by Bezaleel Ashefor on 04/12/2023.
//

import SwiftUI

struct SingleStanding: View {
    var blockSize : CGFloat = 55
    
    
    
    var body: some View {
        HStack(spacing: 10){
            VStack(alignment: .leading, spacing: 0){
                Text("Pauline Lino".replacingOccurrences(of: " ", with: "\n"))
                Text("9").font(.custom(FontsManager.Black, size: blockSize))
            }.frame(minWidth: 0, maxWidth: .infinity, alignment: .leading).padding(.bottom, -10)
            ZStack(alignment: .center){
                Circle().stroke(lineWidth: 1)
                Text("VS")
            }.frame(width: 36, height: 36)
            VStack(alignment: .trailing, spacing: 0){
                Text("Amos Tobi".replacingOccurrences(of: " ", with: "\n")).multilineTextAlignment(.trailing)
                Text("67").font(.custom(FontsManager.Black, size: blockSize))
            }.frame(minWidth: 0, maxWidth: .infinity, alignment: .trailing).padding(.bottom, -10)
        }.padding(15).background(Color.white).clipShape(RoundedRectangle(cornerRadius: 15)).shadow(color: Color.black.opacity(0.1), radius: 5).font(.custom(FontsManager.Regular, size: 16))
    }
}

#Preview {
    SingleStanding().frame(maxWidth: 400)
}
