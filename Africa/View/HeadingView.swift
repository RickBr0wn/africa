//
//  HeadingView.swift
//  Africa
//
//  Created by Rick Brown on 18/11/2020.
//

import SwiftUI

struct HeadingView: View {
  var headingImage: String
  var headingText: String
  
  var body: some View {
    HStack {
      Image(systemName: headingImage)
        .foregroundColor(.accentColor)
        .imageScale(.large)
      
      Text(headingText)
        .font(.title3)
        .fontWeight(.bold)
    } // HStack
    .padding(.vertical)
  } // Body
} // HeadingView

struct HeadingView_Previews: PreviewProvider {
  static var previews: some View {
    HeadingView(headingImage: "photo.on.rectangle.angled", headingText: "Wilderness in Pictures")
      .previewLayout(.sizeThatFits)
      .padding()
  }
}
