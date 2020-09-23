//
//  CodableBundleExtension.swift
//  Africa
//
//  Created by Rick Brown on 23/09/2020.
//

import Foundation

extension Bundle {
  func decode<T: Codable>(_ file: String) -> T {
    // locate the json file in the Bundle
    guard let url = self.url(forResource: file, withExtension: nil) else {
      fatalError("Failed to locate the file in Bundle")
    }
    
    // create a property for the data
    guard let data = try? Data(contentsOf: url) else {
      fatalError("Failed to load Bundle")
    }
    
    // create a decoder
    let decoder = JSONDecoder()
    
    // create a property for the decoded data
    guard let loaded = try? decoder.decode(T.self, from: data) else {
      fatalError("Failed to decode file from Bundle")
    }
    
    // return the ready to use data
    return loaded
  }
}
