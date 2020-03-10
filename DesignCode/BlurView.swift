//
//  BlurView.swift
//  DesignCode
//
//  Created by Ari Supriatna on 17/12/19.
//  Copyright © 2019 Ari Supriatna. All rights reserved.
//

import SwiftUI

// BlurView.swift
struct BlurView: UIViewRepresentable {
  
  let style: UIBlurEffect.Style
  
  func makeUIView(context: UIViewRepresentableContext<BlurView>) -> UIView {
    let view = UIView(frame: .zero)
    view.backgroundColor = .clear
    let blurEffect = UIBlurEffect(style: style)
    let blurView = UIVisualEffectView(effect: blurEffect)
    blurView.translatesAutoresizingMaskIntoConstraints = false
    view.insertSubview(blurView, at: 0)
    NSLayoutConstraint.activate([
      blurView.heightAnchor.constraint(equalTo: view.heightAnchor),
      blurView.widthAnchor.constraint(equalTo: view.widthAnchor),
    ])
    return view
  }
  
  func updateUIView(_ uiView: UIView,
                    context: UIViewRepresentableContext<BlurView>) {
    
  }
}
