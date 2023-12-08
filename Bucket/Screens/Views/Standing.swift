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
                Text("Pauline Lino")
                Text("9")
            }
            ZStack(alignment: .center){
                Circle().stroke(lineWidth: 1).frame(width: 36, height: 36)
                Text("VS")
            }
            VStack(alignment: .trailing){
                Text("Amos Tobi")
                Text("67")
            }
        }.padding().background(Color.white).clipShape(RoundedRectangle(cornerRadius: 10)).shadow(radius: 5)
    }
}

#Preview {
    Standing().frame(maxWidth: 500)
}
