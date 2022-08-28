//
//  HomeView.swift
//  Swiftnews
//
//  Created by GB on 8/23/22.
//

import SwiftUI

struct HomeView: View {
   
    var body: some View {
        TabView{
            FeedsView().tabItem{
                Image(systemName: "newspaper")
                Text("Feed")
            }
            SettingsView().tabItem{
                Image(systemName: "gearshape")
                Text("Settings")
            }
        }
    }
   
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
