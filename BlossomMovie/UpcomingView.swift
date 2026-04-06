//
//  UpcomingView.swift
//  BlossomMovie
//
//  Created by Quang Phat on 6/4/26.
//

import SwiftUI

struct UpcomingView: View {
    let viewModel = ViewModel()
    
    var body: some View {
        NavigationStack {
            GeometryReader { geo in
                switch viewModel.upcomingStatus {
                case .notStarted:
                    EmptyView()
                case .fetching:
                    ProgressView()
                        .frame(width: geo.size.width, height: geo.size.height)
                case .success:
                    VerticalListView(titles: Title.previewTitles, canDelete: false)
                case .failure(let underlyingError):
                    Text(underlyingError.localizedDescription)
                        .errorMessage()
                        .frame(width: geo.size.width, height: geo.size.height)
                }
            }
            .task {
                await viewModel.getUpcomingMovies()
            }
        }
    }
}

#Preview {
    UpcomingView()
}
