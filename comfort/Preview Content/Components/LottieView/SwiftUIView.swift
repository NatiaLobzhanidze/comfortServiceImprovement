//
//  SwiftUIView.swift
//  comfort
//
//  Created by natia lobzhanidze on 05.12.23.
//

import SwiftUI
import Lottie

struct LottieView: UIViewRepresentable {
    let name = "data"
    var loopMode: LottieLoopMode = .loop
    var animationView = LottieAnimationView()

    func makeUIView(context: Context) -> some UIView {
        let view = UIView(frame: .zero)
        animationView.animation = LottieAnimation.named(name)
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = loopMode
        animationView.play()
        animationView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(animationView)
        
        NSLayoutConstraint.activate([
            animationView.widthAnchor.constraint(equalTo: view.widthAnchor),
            animationView.heightAnchor.constraint(equalTo: view.heightAnchor)
        ])
        return view
    }

    func updateUIView(_ uiView: UIViewType, context: Context) { }
}

struct LottieView_Previews: PreviewProvider {
    static var previews: some View {
        LottieView()
            .frame(width: 100, height: 100)
    }
}
