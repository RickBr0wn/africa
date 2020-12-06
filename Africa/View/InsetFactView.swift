//
//  InsetFactView.swift
//  Africa
//
//  Created by Rick Brown on 18/11/2020.
//

import SwiftUI

struct InsetFactView: View {
  let animal: Animal
  
  var body: some View {
    GroupBox {
      TabView {
        ForEach(animal.fact, id: \.self) { item in
          Text(item)
        } // ForEach
      } // TabView
      .tabViewStyle(PageTabViewStyle())
      .frame(minHeight: 158, idealHeight: 168, maxHeight: 180)
    } // GroupBox
  } // Body
} // InsetFactView

struct InsetFactView_Previews: PreviewProvider {
  static let animals: [Animal] = Bundle.main.decode("animals.json")
  
  static var previews: some View {
    InsetFactView(animal: animals[0])
      .previewLayout(.sizeThatFits)
      .padding()
  }
}
