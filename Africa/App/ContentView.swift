//
//  ContentView.swift
//  Africa
//
//  Created by Rick Brown on 23/09/2020.
//

import SwiftUI

struct ContentView: View {
  /// Store the animal data from the external animals.json file in an array.
  let animals: [Animal] = Bundle.main.decode("animals.json")
  /// Store a boolean value to monitor whether the grid view is active or inactive.
  @State private var isGridViewActive: Bool = false
  /// Store a value to be used for haptics.
  let haptics = UIImpactFeedbackGenerator(style: .medium)
  /// Store an array to use as the grid.
  @State private var gridLayout: [GridItem] = [GridItem(.flexible())]
  /// Store an integer value to use for number of columns.
  @State private var gridColumn: Int = 1
  /// Store a string value for the systemName of the icon.
  @State private var toolbarIcon: String = "square.grid.2x2"
  
  /// This function will cycle through the 3 states of the layout (1, 2,and 3 columns)
  func gridSwitch() {
    gridLayout = Array(repeating: .init(.flexible()), count: gridLayout.count % 3 + 1)
    gridColumn = gridLayout.count
    
    /// Set the correct toolbar image dependent on the gridColumn.
    switch gridColumn {
    case 1:
      toolbarIcon = "square.grid.2x2"
    case 2:
      toolbarIcon = "square.grid.3x2"
    case 3:
      toolbarIcon = "rectangle.grid.1x2"
    default:
      toolbarIcon = "square.grid.2x2"
    }
  }
  
  var body: some View {
    NavigationView {
      Group {
        /// The view displayed is dependent on the previously declared boolean value (isGridActive).
        if !isGridViewActive {
          List {
            /// This List will display the main hero image tab view above the list view items.
            CoverImageView()
              .frame(height: 300)
              .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
            
            /// Loops through the animals array and returns an AnimalListItemView wrapped in a NavigationLink
            ForEach(animals) { animal in
              NavigationLink(destination: AnimalDetailView(animal: animal)) {
                AnimalListItemView(animal: animal)
              }
            }
            CopyrightView()
              .modifier(CenterModifier())
          }
        } else {
          ScrollView(.vertical, showsIndicators: false) {
            /// This view presents the grid view.
            LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
              /// Loop through the animals array.
              ForEach(animals) { animal in
                NavigationLink(
                  destination: AnimalDetailView(animal: animal)) {
                  AnimalGridItemView(animal: animal)
                }
              }
            }
            .padding(10)
            .animation(.easeIn)
          }
        }
      }
      /// Adds a title to the ListView
      .navigationBarTitle("Africa", displayMode: .large)
      /// Adds toolbar items (in this case 2 buttons contained in a HStack.
      .toolbar {
        ToolbarItem(placement: .navigationBarTrailing) {
          HStack(spacing: 16) {
            Button(action: {
              print("LIST VIEW ACTIVATED")
              isGridViewActive = false
              haptics.impactOccurred()
            }) {
              Image(systemName: "square.fill.text.grid.1x2")
                .font(.title2)
                .foregroundColor(isGridViewActive ? .primary : .accentColor)
            }
            
            Button(action: {
              print("GRID VIEW ACTIVE")
              isGridViewActive = true
              haptics.impactOccurred()
              gridSwitch()
            }) {
              Image(systemName: toolbarIcon)
                .font(.title2)
                .foregroundColor(isGridViewActive ? .accentColor : .primary)
            }
          }
        }
      }
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
