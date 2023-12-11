//
//  Settings.swift
//  Bucket
//
//  Created by Bezaleel Ashefor on 11/12/2023.
//

import SwiftUI

struct Settings: View {
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.colorScheme) var colorScheme
    @AppStorage("preserve_capture_settings") var preserveCaptureSettings : Bool = false
    @AppStorage("location_data") var locationData : Bool = false
    @AppStorage("grid_setting") var gridSetting : Bool = true
    @State var version : String = ""
    
    var body: some View {
        VStack{
            HStack(spacing: 15){
                Button(action: {presentationMode.wrappedValue.dismiss()}){
                    Image(systemName: "multiply")
                        .font(.system(size: 20, weight: .medium))
                        .contentShape(Rectangle())
                }
                Text("Settings").font(.custom(FontsManager.Bold, size: 18))
                Spacer()
            }.padding([.horizontal], 20).padding([.vertical], 24)
            VStack(){
                Section{
                    Toggle(isOn: $gridSetting, label: {
                        Text("Show Grid"
                        ).font(.custom(FontsManager.Regular, size: 16))
                        
                    })
                    SettingsDivider()
                    Toggle(isOn: $preserveCaptureSettings, label: {
                        Text("Reset camera settings on each start").font(.custom(FontsManager.Regular, size: 16))
                    }).onChange(of: preserveCaptureSettings) { value in
                       
                    }
                    SettingsDivider()
                    HStack{
                        Text("Save location data to images you take").font(.custom(FontsManager.Regular, size: 14)).opacity(0.7)
                        Spacer()
                    }.padding(.vertical, 5)
                                    } header: {
                    HStack{
                        Text("Camera").font(.custom(FontsManager.Bold, size: 18))
                        Spacer()
                    }
                }
                Spacer().frame(height: 50)
                Section{
                    Toggle(isOn: $preserveCaptureSettings, label: {
                        Text("Daily sales notification").font(.custom(FontsManager.Regular, size: 16))
                    }).onChange(of: preserveCaptureSettings) { value in
                       
                    }
                    SettingsDivider()
                    HStack{
                        Text("Save location data to images you take").font(.custom(FontsManager.Regular, size: 14)).opacity(0.7)
                        Spacer()
                    }.padding(.vertical, 5)
                } header: {
                    HStack{
                        Text("Location").font(.custom(FontsManager.Bold, size: 18))
                        Spacer()
                    }
                }
                Spacer().frame(height: 70)
                Image(colorScheme == .dark ? "bez_sign" : "bez_sign_black").resizable().scaledToFit().frame(width: 140)
                Text(version).font(.custom(FontsManager.Regular, size: 14))
            }.padding([.horizontal], 20).padding([.vertical], 10).opacity(0.7)
            Spacer()
        }.onAppear{
            initValues()
        }
    }
    
    private func initValues(){
        let versionText = "v" + Bundle.main.releaseVersionNumberPretty + " (" + Bundle.main.buildVersionNumber! + ")"
        version = "Bucket " + versionText
    }
}

#Preview {
    Settings()
}

struct SettingsDivider: View{
    
    var body: some View {
        Divider().overlay(Color.white.opacity(0.6))
    }
    
}

