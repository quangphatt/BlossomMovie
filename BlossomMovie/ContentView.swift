//
//  ContentView.swift
//  BlossomMovie
//
//  Created by Quang Phat on 7/3/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView{
            Tab(Constants.homeString, systemImage: Constants.homeIconString) {
                HomeView()
            }
            Tab(Constants.upcomingString, systemImage: Constants.upcomingIconString) {
                UpcomingView()
            }
            Tab(Constants.searchString, systemImage: Constants.searchIconString) {
                SearchView()
            }
            Tab(Constants.downloadString, systemImage: Constants.downloadIconString) {
                Text(Constants.downloadString)
            }
        }
    }
}

#Preview {
    ContentView()
}
