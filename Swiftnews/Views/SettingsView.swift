//
//  SettingsView.swift
//  Swiftnews
//
//  Created by GB on 8/28/22.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        NavigationView{
            Form {
                Section(header: Text("Display"), footer: Text("System settings will override Dark Mode and use the current device theme")){
                    Toggle(isOn: .constant(false), label: {
                        Text("Dark Mode")
                    })
                    
                    Toggle(isOn: .constant(true), label: {
                        Text("use system settings")
                    })
                }
                Section{
                    Label("Follow me on twitter @kutigbolahan", systemImage: "link")
                }.foregroundColor(.blue).font(.system(size:16,weight:.semibold))
          
            }
            .navigationTitle("Settings")
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
