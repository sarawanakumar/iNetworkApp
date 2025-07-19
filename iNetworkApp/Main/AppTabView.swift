//
//  TabView.swift
//  iNetworkApp
//
//  Created by Saravanakumar Selladurai on 18/07/25.
//

import SwiftUI

struct AppTabView: View {
    var body: some View {
        TabView {
            // First Tab
            Text("This is the Home Tab")
                .font(.largeTitle)
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                }

            // Second Tab
            NavigationView { // Often you'll want navigation within a tab
                List {
                    Text("Item 1")
                    Text("Item 2")
                    Text("Item 3")
                }
                .navigationTitle("Settings")
            }
            .tabItem {
                Label("Settings", systemImage: "gearshape.fill")
            }

            // Third Tab
            VStack {
                Image(systemName: "person.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                Text("Profile View")
                    .font(.title)
            }
            .tabItem {
                Label("Profile", systemImage: "person.circle.fill")
            }
        }
    }
}
