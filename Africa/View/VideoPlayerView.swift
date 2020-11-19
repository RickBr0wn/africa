//
//  VideoPlayerView.swift
//  Africa
//
//  Created by Rick Brown on 19/11/2020.
//

import SwiftUI
import AVKit

struct VideoPlayerView: View {
  var videoSelected: String
  var videoTitle: String
  
  var body: some View {
    VStack {
      VideoPlayer(player: playVideo(fileName: videoSelected, fileFormat: "mp4")) {
        // Text(videoTitle)
      } // VideoPlayer
      .overlay(
        Image("logo")
          .resizable()
          .scaledToFit()
          .frame(width: 32, height: 32)
          .padding(.top, 6)
          .padding(.horizontal, 8)
        , alignment: .topLeading
      )  // Overlay
    } // VStack
    .foregroundColor(.accentColor)
    .navigationBarTitle(videoTitle, displayMode: .inline)
  } // Body
} // VideoPlayerView

struct VideoPlayerView_Previews: PreviewProvider {
  static var previews: some View {
    NavigationView {
      VideoPlayerView(videoSelected: "lion", videoTitle: "Lion")
    }
  }
}
