//
//  LoaderView.swift
//  Bucket
//
//  Created by Bezaleel Ashefor on 12/12/2023.
//

import SwiftUI

struct LoaderView: View {
    @State var message : [String]
    @Binding var loaderCount : Int
    
    var body: some View {
        VStack(spacing: 15){
            Spacer()
            ProgressView().controlSize(.regular)
            Text(message[loaderCount]).font(.custom(FontsManager.Regular, size: 16)).multilineTextAlignment(.center)
            Spacer()
        }
    }
}

#Preview {
    LoaderView(message: ["Fetching players"], loaderCount: .constant(0))
}
