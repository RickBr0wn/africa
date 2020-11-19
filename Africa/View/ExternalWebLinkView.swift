//
//  ExternalWebLinkView.swift
//  Africa
//
//  Created by Rick Brown on 19/11/2020.
//

import SwiftUI

struct ExternalWebLinkView: View {
  let animal: Animal
  
  var body: some View {
    GroupBox {
      HStack {
        Image(systemName: "globe")
        Text("Wikipedia")
        Spacer()
        Group {
          Link(animal.name, destination: (URL(string: animal.link) ?? URL(string: "https://wikipedia.org"))!)
          
          Image(systemName: "arrow.up.right.square")
        } // Group
      } // HStack
    } // GroupBox
  } // Body
} // ExternalWebLink

struct ExternalWebLinkView_Previews: PreviewProvider {
  static let animals: [Animal] = Bundle.main.decode("animals.json")
  
  static var previews: some View {
    ExternalWebLinkView(animal: animals[0])
      .previewLayout(.sizeThatFits)
      .padding()
  }
}
