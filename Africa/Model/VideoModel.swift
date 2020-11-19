//
//  VideoModel.swift
//  Africa
//
//  Created by Rick Brown on 19/11/2020.
//

import Foundation

struct Video: Codable, Identifiable {
  let id: String
  let name: String
  let headline: String
  // Computed property
  var thumbnail: String {
    "video-\(id)"
  }
}
