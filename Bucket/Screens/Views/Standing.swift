//
//  Standing.swift
//  Bucket
//
//  Created by Bezaleel Ashefor on 04/12/2023.
//

import SwiftUI

struct Standing: View {
    var body: some View {
        HStack(spacing: 10){
            VStack(alignment: .leading){
                Text("Pauline Lino").frame(
                    minWidth: 0,
                    maxWidth: .infinity,
                    
                    alignment: .topLeading
                )
                Text("9").font(.custom(FontsManager.Black, size: 50))
            }.frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            ZStack(alignment: .center){
                Circle().stroke(lineWidth: 1)
                Text("VS")
            }.frame(width: 36, height: 36)
            VStack(alignment: .trailing){
                Text("Amos Tobi")
                Text("67").font(.custom(FontsManager.Black, size: 50))
            }.frame(minWidth: 0, maxWidth: .infinity, alignment: .trailing)
        }.padding().background(Color.white).clipShape(RoundedRectangle(cornerRadius: 15)).shadow(color: Color.black.opacity(0.1), radius: 5).font(.custom(FontsManager.Regular, size: 16))
    }
}

#Preview {
    Standing().frame(maxWidth: 400)
}
