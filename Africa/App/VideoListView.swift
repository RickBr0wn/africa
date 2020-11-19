//
//  VideoListView.swift
//  Africa
//
//  Created by Rick Brown on 23/09/2020.
//

import SwiftUI

struct VideoListView: View {
  @State var videos: [Video] = Bundle.main.decode("videos.json")
  
  let hapticImpact = UIImpactFeedbackGenerator(style: .medium)
  
  var body: some View {
    NavigationView {
      List {
        ForEach(videos) { item in
          NavigationLink(
            destination: VideoPlayerView(videoSelected: item.id, videoTitle: item.name)) {
            VideoListItemView(video: item)
              .padding(.vertical, 8)
          }
        }
      } // List
      .listStyle(InsetGroupedListStyle())
      .navigationBarTitle("Videos", displayMode: .inline)
      .toolbar {
        ToolbarItem(placement: .navigationBarTrailing) {
          Button(action: {
           // Shuffle
            videos.shuffle()
            hapticImpact.impactOccurred()
          }) {
            Image(systemName: "arrow.2.squarepath")
          } // Button
        } // ToolbarItem
      } // Toolbar
    } // NavigationView
  } // Body
} // VideoListView

struct VideoListView_Previews: PreviewProvider {
  static var previews: some View {
    VideoListView()
  }
}
