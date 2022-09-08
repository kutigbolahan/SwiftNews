//
//  HomeView.swift
//  Swiftnews
//
//  Created by GB on 8/23/22.
//

import SwiftUI

struct HomeView: View {
    @AppStorage("darkModeEnabled") private var darkModeEnabled = false
    @AppStorage("systemThemeEnabled") private var systemThemeEnabled = false
   
    var body: some View {
        TabView{
            FeedsView().tabItem{
                Image(systemName: "newspaper")
                Text("Feed")
            }
            SettingsView(darkModeEnabled: $darkModeEnabled, systemThemeEnabled: $systemThemeEnabled).tabItem{
                Image(systemName: "gearshape")
                Text("Settings")
            }
        }.onAppear{
            SystemThemeManager.shared.handleTheme(darkMode: darkModeEnabled, system: systemThemeEnabled)
        }
    }
   
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
