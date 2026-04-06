//
//  BlossomMovieApp.swift
//  BlossomMovie
//
//  Created by Quang Phat on 7/3/26.
//

import SwiftUI
import SwiftData

@main
struct BlossomMovieApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Title.self)
    }
}
