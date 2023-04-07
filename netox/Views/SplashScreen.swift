//
//  SplashScreen.swift
//  netox
//
//  Created by Linda on 06/04/2023.
//

import SwiftUI

struct SplashScreen: View {
    
    @State private var animatedGradient = false
    
    var body: some View {
        LinearGradient(colors: [.blue, .green], startPoint: animatedGradient ? .topLeading:.bottomLeading, endPoint: animatedGradient ? .bottomTrailing: .topTrailing)
            .ignoresSafeArea()
            .onAppear {
                withAnimation(.linear(duration: 2.0).repeatForever(autoreverses: true))
                {
                    animatedGradient.toggle()
                }
            }
    }
}

struct SplashScreen_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreen()
    }
}
