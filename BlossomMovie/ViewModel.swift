//
//  ViewModel.swift
//  BlossomMovie
//
//  Created by Quang Phat on 9/3/26.
//

import Foundation

@Observable
class ViewModel {
    enum FetchStatus {
        case notStarted
        case fetching
        case success
        case failure(underlyingError: Error)
    }
    private(set) var homeStatus: FetchStatus = .notStarted
    private(set) var videoIdStatus: FetchStatus = .notStarted
    
    private let dataFetcher = DataFetcher()
    var trendingMovies: [Title] = []
    var trendingTV: [Title] = []
    var topRatedMovies: [Title] = []
    var topRatedTV: [Title] = []
    var heroTitle = Title.previewTitles[0]
    var videoId = ""
    
    func getTitles() async {
        homeStatus = .fetching
        
        if trendingMovies.isEmpty {
            do {
                async let tMovies = dataFetcher.fetchTitles(for: "movie", by: "trending")
                async let tTV = dataFetcher.fetchTitles(for: "tv", by: "trending")
                async let tRMovies = try await dataFetcher.fetchTitles(for: "movie", by: "top_rated")
                async let tRTV = try await dataFetcher.fetchTitles(for: "tv", by: "top_rated")
                
                trendingMovies = try await tMovies
                trendingTV = try await tTV
                topRatedMovies = try await tRMovies
                topRatedTV = try await tRTV
                
                if let title = trendingMovies.randomElement() {
                    heroTitle = title
                }
                
                homeStatus = .fetching
            } catch {
                print(error)
                homeStatus = .failure(underlyingError: error)
            }
        } else {
            homeStatus = .success
        }
    }
    
    func getVideoId(for title: String) async {
        videoIdStatus = .fetching
        
        do {
            videoId = try await dataFetcher.fetchVideoId(for: title)
            videoIdStatus = .success
        } catch {
            print(error)
            videoIdStatus = .failure(underlyingError: error)
        }
    }
}
