//
//  Gallery.swift
//  Africa
//
//  Created by Rick Brown on 23/09/2020.
//

import SwiftUI

struct GalleryView: View {
  /// Store the animals data (from the bundle) in an array.
  let animals: [Animal] = Bundle.main.decode("animals.json")
  /// Store the title image to be displayed
  @State private var selectedAnimal: String = "lion"
  /// Store the UIImpactFeedbackGenerator
  let haptics = UIImpactFeedbackGenerator(style: .medium)
  /// Simple grid definition (3 columns).
  //    let gridLayout: [GridItem] = [
  //      GridItem(.flexible()),
  //      GridItem(.flexible()),
  //      GridItem(.flexible())
  //    ]
  
  /// Effiecient grid definition
//  let gridLayout: [GridItem] = Array(repeating: GridItem(.flexible()), count: 3)
  
  /// Dynamic grid layout
  @State private var gridLayout: [GridItem] = [GridItem(.flexible())]
  @State private var gridColumn: Double = 3.0
  
  func gridSwitch() {
    gridLayout = Array(repeating: .init(.flexible()), count: Int(gridColumn))
  }
  
  var body: some View {
    ScrollView(.vertical, showsIndicators: false) {
      VStack(alignment: .center, spacing: 30) {
        Image(selectedAnimal)
          .resizable()
          .scaledToFit()
          .clipShape(Circle())
          .overlay(Circle().stroke(Color.white, lineWidth: 8))
        
        /// Use the binding of gridColumn to specify the slider value
        Slider(value: $gridColumn, in: 2...4, step: 1)
          .padding(.horizontal)
          .onChange(of: gridColumn, perform: { value in
            gridSwitch()
          })
        
        LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
          ForEach(animals) { item in
            Image(item.image)
              .resizable()
              .scaledToFit()
              .clipShape(Circle())
              .overlay(Circle().stroke(Color.white, lineWidth: 1))
              .onTapGesture {
                selectedAnimal = item.image
                haptics.impactOccurred()
              }
          }
        }
        .animation(.easeIn)
        .onAppear(perform: {
          gridSwitch()
        })
      }
      .padding(.horizontal, 10)
      .padding(.vertical, 50)
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
