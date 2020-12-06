//
//  MapAnnotationView.swift
//  Africa
//
//  Created by Rick Brown on 20/11/2020.
//

import SwiftUI

struct MapAnnotationView: View {
  var location: NationalParkLocation
  
  var body: some View {
    ZStack {
      Image(location.image)
        .resizable()
        .scaledToFit()
        .frame(width: 48, height: 48, alignment: .center)
        .clipShape(Circle())
    } // ZStack
  } // Body
} // MapAnnotationView

struct MapAnnotationView_Previews: PreviewProvider {
  static var locations: [NationalParkLocation] = Bundle.main.decode("locations.json")
  
  static var previews: some View {
    MapAnnotationView(location: locations[0])
      .previewLayout(.sizeThatFits)
      .padding()
  }
}
