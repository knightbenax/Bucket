//
//  EmptyView.swift
//  Bucket
//
//  Created by Bezaleel Ashefor on 11/12/2023.
//

import SwiftUI

struct EmptyView: View {
    @State var message : String
    @State var button : String = "Fetch"
    @State var showButton : Bool = true
    var action : () -> () = {}
    
    var body: some View {
        VStack{
            Spacer()
            VStack(spacing: 15){
                Text(message).font(.custom(FontsManager.Regular, size: 16)).multilineTextAlignment(.center)
                if (showButton){
                    Button(action: {
                        action()
                    }){
                        HStack{
                            Text(button).foregroundStyle(Color.white).font(.custom(FontsManager.Medium, size: 16))
                        }.padding(.vertical, 12).padding(.horizontal, 45).contentShape(Rectangle())
                    }.background(Color.accentColor).cornerRadius(30)
                }
            }
            Spacer()
        }
    }
}

#Preview {
    EmptyView(message: "You haven't added any domains yet. \nAdd one to get Plomer started", showButton: true, action: {})
}
