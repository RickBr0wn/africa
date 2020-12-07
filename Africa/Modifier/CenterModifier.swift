//
//  CenterModifier.swift
//  Africa
//
//  Created by Rick Brown on 07/12/2020.
//

import SwiftUI

struct CenterModifier: ViewModifier {
  func body(content: Content) -> some View {
    HStack {
      Spacer()
      content
      Spacer()
    }
  }
}
