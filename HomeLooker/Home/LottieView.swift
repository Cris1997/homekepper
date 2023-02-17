//
//  LottieView.swift
//  HomeLooker
//
//  Created by Cristian Rosales Deloya on 14/02/23.
//
import SwiftUI
import Lottie

struct LottieView: UIViewRepresentable {
  let name: String
  let loopMode: LottieLoopMode = .loop
  var animationView = AnimationView()

  func makeUIView(context: UIViewRepresentableContext<LottieView>) -> UIView {
    let view = UIView(frame: .zero)
    animationView.animation = Animation.named(name)
    animationView.contentMode = .scaleAspectFit
    animationView.loopMode = loopMode
    animationView.play()
    animationView.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(animationView)

    NSLayoutConstraint.activate([
      animationView.heightAnchor.constraint(equalTo: view.heightAnchor),
      animationView.widthAnchor.constraint(equalTo: view.widthAnchor)
    ])

    return view
  }

  func updateUIView(_ uiView: UIView, context: Context) { }
}
