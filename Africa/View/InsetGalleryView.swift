//
//  InsetGalleryView.swift
//  Africa
//
//  Created by Rick Brown on 18/11/2020.
//

import SwiftUI

struct InsetGalleryView: View {
  let animal: Animal
  
  var body: some View {
    ScrollView(.horizontal, showsIndicators: false) {
      HStack(alignment: .center, spacing: 15) {
        ForEach(animal.gallery, id: \.self) { item in
          Image(item)
            .resizable()
            .scaledToFit()
            .frame(height: 200)
            .cornerRadius(12)
        } // ForEach
      } // HStack
    } // ScrollView
  } // Body
} // insetGalleryView

struct InsetGalleryView_Previews: PreviewProvider {
  static let animals: [Animal] = Bundle.main.decode("animals.json")
  
  static var previews: some View {
    InsetGalleryView(animal: animals[0])
      .previewLayout(.sizeThatFits)
      .padding()
  }
}
