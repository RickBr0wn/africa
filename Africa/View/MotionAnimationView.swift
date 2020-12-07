//
//  MotionAnimationView.swift
//  Africa
//
//  Created by Rick Brown on 07/12/2020.
//

import SwiftUI

struct MotionAnimationView: View {
  /// Store a random number to use for the amount of circles.
  @State private var randomCircle = Int.random(in: 12...16)
  /// Store a boolean value to monitor whether the animation is running.
  @State private var isAnimating: Bool = false
  
  /// Returns a random number between zero and the maximum value supplied as a parameter.
  func randomCoordinate(max: CGFloat) -> CGFloat {
    return CGFloat.random(in: 0...max)
  }
  
  /// Returns a random size based on the range of 10 to 300 (inclusive).
  func randomSize() -> CGFloat {
    return CGFloat.random(in: 10...300)
  }
  
  /// Returns a random number to use for scaling between the range of 0.1 and 2.0 (inclusive).
  func randomScale() -> CGFloat {
    return CGFloat(Double.random(in: 0.1...2.0))
  }
  
  /// Returns a random number to use as a speed value for the circle.
  func randomSpeed() -> Double {
    return Double.random(in: 0.025...1.0)
  }
  
  /// Returns a random number to use for the circles delay value.
  func randomDelay() -> Double {
    return Double.random(in: 0...2)
  }
  
  var body: some View {
    ///  When wrapping a view in a GeometryReader the origin point of the embeded view (the ZStack in this case) will move from center to top left.
    GeometryReader { geometry in
      /// Now the ZStack will positioned in the top left of the screen, and not the center.
      ZStack {
        /// Loop through the circle amount (in this case, between 12 & 16) and generate a new instance of the circle for each number.
        ForEach(0...randomCircle, id: \.self) { item in
          /// Inside of the GeometryReader the .position() modifier can be used to move the cirlcle to the center of the screen.
          Circle()
            .foregroundColor(.gray)
            .opacity(0.15)
            .frame(width: randomSize(), height: randomSize(), alignment: .center)
            .scaleEffect(isAnimating ? randomScale() : 1)
            .position(x: randomCoordinate(max: geometry.size.width), y: randomCoordinate(max: geometry.size.height))
            .animation(
              Animation.interpolatingSpring(stiffness: 0.5, damping: 0.5)
                .repeatForever()
                .speed(randomSpeed())
                .delay(randomDelay())
            )
            .onAppear(perform: {
              isAnimating = true
            })
        } // ForEach
//        Text("Height: \(Int(geometry.size.height)), Width: \(Int(geometry.size.width))")
      }
      .drawingGroup()
    }
  }
}

struct MotionAnimationView_Previews: PreviewProvider {
  static var previews: some View {
    MotionAnimationView()
  }
}
