//
//  SplashView.swift
//  hipoapp
//
//  Created by Mete Varol on 22.04.2023.
//

import SwiftUI

struct SplashView: View {
    @State private var rotationDegree: Double = 0
    
    let animation = Animation
        .easeInOut(duration: 1)
        .repeatCount(2, autoreverses: false)
    
    var body: some View {
        ZStack {
            Color(.white).edgesIgnoringSafeArea(.all)
            
            Image("logo")
                .resizable()
                .scaledToFit()
                .frame(width: 120, height: 120)
                .rotationEffect(Angle(degrees: rotationDegree))
                .onAppear {
                    withAnimation(animation) {
                        rotationDegree = 360 * 2
                    }
                }
        }
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
