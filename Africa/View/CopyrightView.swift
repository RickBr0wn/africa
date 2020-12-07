//
//  CopyrightView.swift
//  Africa
//
//  Created by Rick Brown on 07/12/2020.
//

import SwiftUI

struct CopyrightView: View {
    var body: some View {
      VStack {
        Image("compass")
          .resizable()
          .scaledToFit()
          .frame(width: 128, height: 128)
        
        Text("""
  Rick Brown © 2020
  """)
            .font(.footnote)
          .multilineTextAlignment(.center)
      }
      .padding()
      .opacity(0.4)
    }
}

struct CopyrightView_Previews: PreviewProvider {
    static var previews: some View {
        CopyrightView()
          .previewLayout(.sizeThatFits)
          .padding()
    }
}
