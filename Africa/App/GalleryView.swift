//
//  Gallery.swift
//  Africa
//
//  Created by Rick Brown on 23/09/2020.
//

import SwiftUI

struct GalleryView: View {
  var body: some View {
    ScrollView(.vertical, showsIndicators: false) {
      Text("Gallery")
    }
    .frame(maxWidth: .infinity, maxHeight: .infinity)
    .background(MotionAnimationView())
  }
}

struct GalleryView_Previews: PreviewProvider {
  static var previews: some View {
    GalleryView()
  }
}
