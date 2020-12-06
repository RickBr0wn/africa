//
//  MapView.swift
//  Africa
//
//  Created by Rick Brown on 23/09/2020.
//

import SwiftUI
import MapKit

struct MapView: View {
  @State private var region: MKCoordinateRegion = {
    var mapCoordinates = CLLocationCoordinate2D(latitude: 6.600286, longitude: 16.4377599)
    var mapZoomLevel = MKCoordinateSpan(latitudeDelta: 70.0, longitudeDelta: 70.0)
    var mapRegion = MKCoordinateRegion(center: mapCoordinates, span: mapZoomLevel)
    return mapRegion
  }()
  
  let locations: [NationalParkLocation] = Bundle.main.decode("locations.json")
  
  var body: some View {
    // Basic Map
    // Map(coordinateRegion: $region)
    Map(coordinateRegion: $region, annotationItems: locations,
        annotationContent: { item in
          // Pin - always static
          // MapPin(coordinate: item.location, tint: .accentColor)
          
          // Marker - always static
          // MapMarker(coordinate: item.location, tint: .accentColor)
          
          // Custom annotation - can be interactive
          // MapAnnotation(coordinate: item.location) {
          //  Image("logo")
          //    .resizable()
          //    .scaledToFit()
          //    .frame(width: 32, height: 32, alignment: .center)
          //  }
          
          // Complex map annontation - can be interactive
          MapAnnotation(coordinate: item.location) {
            MapAnnotationView(location: item)
          } // MapAnnotation
        }) // Map
      .overlay(
        HStack(alignment: .center, spacing: 12) {
          Image("compass")
            .resizable()
            .scaledToFit()
            .frame(width: 48, height: 48, alignment: .center)
          
          VStack(alignment: .leading, spacing: 3) {
            
            HStack {
              Text("Latitude: ")
                .font(.footnote)
                .fontWeight(.bold)
                .foregroundColor(.accentColor)
              
              Spacer()
              
              Text("\(region.center.latitude)")
                .font(.footnote)
                .foregroundColor(.white)
            } // HStack
            
            
            Divider()
            
            HStack {
              Text("Longitude: ")
                .font(.footnote)
                .fontWeight(.bold)
                .foregroundColor(.accentColor)
              
              Spacer()
              
              Text("\(region.center.longitude)")
                .font(.footnote)
                .foregroundColor(.white)
            } // HStack
            
          } // VStack
        } // HStack
        .padding(.vertical, 12)
        .padding(.horizontal, 16)
        .background(
          Color.black
            .cornerRadius(8)
            .opacity(0.8)
        ) // Background
        .padding(),
        alignment: .top
      ) // Overlay
    
  } // Body
} // MapView

struct MapView_Previews: PreviewProvider {
  static var previews: some View {
    MapView()
  }
}
