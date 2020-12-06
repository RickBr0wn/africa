//
//  ContentView.swift
//  Africa
//
//  Created by Rick Brown on 23/09/2020.
//

import SwiftUI

struct ContentView: View {
  /// Pull in the animal data from the external animals.json file
  let animals: [Animal] = Bundle.main.decode("animals.json")
  
  var body: some View {
    NavigationView {
      List {
        /// Main hero image section
        CoverImageView()
          .frame(height: 300)
          .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
        
        /// List the animals from the data
        ForEach(animals) { animal in
          NavigationLink(destination: AnimalDetailView(animal: animal)) {
            AnimalListItemView(animal: animal)
          } // NavigationLink
        } // ForEach
      } // List
      .navigationBarTitle("Africa", displayMode: .large)
    } // NavigationView
  } // Body
} // ContentView

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
