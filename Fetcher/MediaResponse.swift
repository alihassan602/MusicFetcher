//
//  MediaResponse.swift
//  Fetcher
//
//  Created by Ali Hassan on 28/06/2020.
//  Copyright © 2020 Ali Hassan. All rights reserved.
//

import Foundation

struct MediaResponse: Codable {
  var results: [MusicItem]
}

struct MusicItem: Codable, Identifiable  {
  let id: Int
  let artistName: String
  let trackName: String
  let collectionName: String
  let previewUrl: String
  let artwork: String
  
  enum CodingKeys: String, CodingKey {
    case id = "trackId"
    case artistName
    case trackName
    case collectionName
    case previewUrl
    case artwork = "artworkUrl100"
  }
}

