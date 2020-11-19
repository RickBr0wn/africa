//
//  AnimalDetailView.swift
//  Africa
//
//  Created by Rick Brown on 18/11/2020.
//

import SwiftUI

struct AnimalDetailView: View {
  let animal: Animal
  
  var body: some View {
    ScrollView(.vertical, showsIndicators: false) {
      VStack(alignment: .center, spacing: 20) {
        // Hero Image
        Image(animal.image)
          .resizable()
          .scaledToFit()
        
        // Title
        Text(animal.name.uppercased())
          .font(.largeTitle)
          .fontWeight(.heavy)
          .multilineTextAlignment(.center)
          .foregroundColor(.primary)
          .background(Color.accentColor.frame(height: 6).offset(y: 24))
          
        // Headline
        Text(animal.headline)
          .font(.headline)
          .multilineTextAlignment(.leading)
          .foregroundColor(.accentColor)
          .padding(.horizontal)
        
        // Gallery
        Group {
          HeadingView(headingImage: "photo.on.rectangle.angled", headingText: "\(animal.name)s in the wild")
          
          InsetGalleryView(animal: animal)
        }// Group
        .padding(.horizontal)
        
        // Facts
        Group {
          HeadingView(headingImage: "questionmark.circle", headingText: "Did you know?")
          InsetFactView(animal: animal)
        } // Group
        .padding(.horizontal)
        
        // Description
        Group {
          HeadingView(headingImage: "info.circle", headingText: "All about \(animal.name)s")
          
          Text(animal.description)
            .multilineTextAlignment(.leading)
            .layoutPriority(1)
        } // Group
        .padding(.horizontal)
        
        // Map
        Group {
          HeadingView(headingImage: "map", headingText: "National Parks")
          
          InsetMapView()
        } // Group
        .padding(.horizontal)
        
        // Link
        Group {
          HeadingView(headingImage: "books.vertical", headingText: "Learn More")
          
          ExternalWebLinkView(animal: animal)
        } //Group
        .padding(.horizontal)
        
      } // VStack
      .navigationBarTitle("Learn about \(animal.name)s", displayMode: .inline)
    } // ScrollView
  } // Body
} // Animal Detail View

struct AnimalDetailView_Previews: PreviewProvider {
  static let animals: [Animal] = Bundle.main.decode("animals.json")
  
  static var previews: some View {
    NavigationView {
      AnimalDetailView(animal: animals[0])
    }
    .previewDevice("iPhone 12")
  }
}
