//
//  YoutubeSearchResponse.swift
//  BlossomMovie
//
//  Created by Quang Phat on 16/3/26.
//

import Foundation

public struct YoutubeSearchResponse: Codable {
    let items: [ItemProperties]?
}

struct ItemProperties: Codable {
    let id: IdProperties?
}

struct IdProperties: Codable {
    let videoId: String
}
