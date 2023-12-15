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
    @State private var showingAlertPlayers = false
    @State private var showingAlertMatches = false
    var playersViewModel = PlayersViewModel()
    var matchesViewModel = MatchViewModel()
    @ObservedObject var viewObserver : ViewObserver
    
    var body: some View {
        VStack{
            HStack(spacing: 15){
                Button(action: {presentationMode.wrappedValue.dismiss()}){
                    Image(systemName: "multiply")
                        .font(.system(size: 20, weight: .medium))
                        .contentShape(Rectangle()).foregroundStyle(Color.label)
                }
                Text("Settings").font(.custom(FontsManager.Bold, size: 18))
                Spacer()
            }.padding([.horizontal], 20).padding([.vertical], 24)
            VStack(){
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
                Spacer().frame(height: 50)
                Section{
                    HStack{
                        Text("Matches").font(.custom(FontsManager.Regular, size: 16))
                        Spacer()
                        Button(action: {
                            showingAlertMatches = true
                        }){
                            HStack{
                                Text("Delete Matches").foregroundStyle(Color.white).font(.custom(FontsManager.Medium, size: 16))
                            }.padding(.vertical, 12).padding(.horizontal, 45).contentShape(Rectangle())
                        }
                        .background(Color.accentColor)
                        .cornerRadius(30)
                        .alert(isPresented: $showingAlertMatches) {
                                    Alert(
                                        title: Text("Warning"),
                                        message: Text("Are you sure you want to clear all matches?"),
                                        primaryButton: .default(
                                                        Text("Cancel"),
                                                        action: {}
                                                    ),
                                                    secondaryButton: .destructive(
                                                        Text("Clear"),
                                                        action: {
                                                            matchesViewModel.clearMatches()
                                                            viewObserver.clearMatches = true
                                                            viewObserver.clearStats = true
                                                        }
                                                    )
                                    )
                                }
                    }
                    HStack{
                        Text("Players").font(.custom(FontsManager.Regular, size: 16))
                        Spacer()
                        Button(action: {
                            showingAlertPlayers = true
                        }){
                            HStack{
                                Text("Delete Player").foregroundStyle(Color.white).font(.custom(FontsManager.Medium, size: 16))
                            }.padding(.vertical, 12).padding(.horizontal, 45).contentShape(Rectangle())
                        }
                        .background(Color.accentColor)
                        .cornerRadius(30)
                        .alert(isPresented: $showingAlertPlayers) {
                                    Alert(
                                        title: Text("Warning"),
                                        message: Text("Are you sure you want to clear all players?"),
                                        primaryButton: .default(
                                                        Text("Cancel"),
                                                        action: {}
                                                    ),
                                                    secondaryButton: .destructive(
                                                        Text("Clear"),
                                                        action: {
                                                            playersViewModel.clearPlayers()
                                                            matchesViewModel.clearMatches()
                                                            viewObserver.clearMatches = true
                                                            viewObserver.clearPlayers = true
                                                            viewObserver.clearStats = true
                                                        }
                                                    )
                                    )
                                }
                    }
                    SettingsDivider()
                    HStack{
                        Text("Delete things here only if you must").font(.custom(FontsManager.Regular, size: 14)).opacity(0.7)
                        Spacer()
                    }.padding(.vertical, 5)
                } header: {
                    HStack{
                        Text("Danger Zone").font(.custom(FontsManager.Bold, size: 18)).foregroundStyle(Color.red)
                        Spacer()
                    }
                }
                Spacer().frame(height: 40)
                Image(colorScheme == .dark ? "bez_sign" : "bez_sign_black").resizable().scaledToFit().frame(width: 120)
                Text("Bucket was made for the maiden 1v1 basketball tournament at GOA Abesan, Lagos, Nigeria").font(.custom(FontsManager.Regular, size: 14))
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
    Settings( viewObserver: ViewObserver())
}

struct SettingsDivider: View{
    
    var body: some View {
        Divider().overlay(Color.label.opacity(0.6))
    }
    
}

