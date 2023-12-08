//
//  Home.swift
//  Bucket
//
//  Created by Bezaleel Ashefor on 04/12/2023.
//

import SwiftUI

struct Home: View {
    var body: some View {
        ZStack(alignment: .bottom){
            VStack{
                
            }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
            BottomNavBar()
        }.background(Color("HomeBg"))
    }
}

#Preview {
    Home()
}
