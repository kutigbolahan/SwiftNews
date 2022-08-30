//
//  SettingsView.swift
//  Swiftnews
//
//  Created by GB on 8/28/22.
//

import SwiftUI

struct SettingsView: View {
    @Binding var darkModeEnabled: Bool
    @Binding var systemThemeEnabled: Bool
    var body: some View {
        NavigationView{
            Form {
                Section(header: Text("Display"), footer: Text("System settings will override Dark Mode and use the current device theme")){
                    Toggle(isOn: $darkModeEnabled, label: {
                        Text("Dark Mode")
                    })
                    
                    Toggle(isOn: $systemThemeEnabled, label: {
                        Text("use system settings")
                    })
                }
                Section{
                    Link(destination: URL(string: Constants.twitter)!, label:{
                        Label("Follow me on twitter @kutigbolahan", systemImage: "link")
                       
                    } )
                    Link("Contact me via email",  destination: URL(string: Constants.email)!)
                    Link("Call me",  destination: URL(string: Constants.number)!)
                    
                }.foregroundColor(.blue).font(.system(size:16,weight:.semibold))
          
            }
            .navigationTitle("Settings")
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView(darkModeEnabled: .constant(false), systemThemeEnabled: .constant(false))
    }
}
