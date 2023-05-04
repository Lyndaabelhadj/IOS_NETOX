//
//  SplashScreenView.swift
//  netox
//
//  Created by Linda BELHADJ  on 4/5/2023.
//

import SwiftUI

struct SplashScreenView: View {
    @State var animate = false
    @State var endSplash = false
    
    var body: some View {
        ZStack {
            
            LoginView()
            
            ZStack {
                Color("colorblue")
                Image("netoxlogo")
                    .resizable()
                    .renderingMode(.original)
                    .aspectRatio(contentMode: animate ? .fill : .fit)
                    .frame(width: animate ? nil : 100, height: animate ? nil : 100)
                
                //scaling view
                    .scaleEffect(animate ? 0:1 )
                //setting width to avoid over size
                    .frame(width: UIScreen.main.bounds.width)
                
            }
            .ignoresSafeArea(.all,edges: .all)
            .onAppear(perform: animateSplash)
            
            //hiding view after finished
            .opacity(endSplash ? 0 : 1)
        }
    }
    
    func animateSplash(){
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.85) {
            withAnimation(Animation.easeOut(duration: 0.65)){
                animate.toggle()
            }
            withAnimation(Animation.easeOut(duration: 0.35)){
                endSplash.toggle()
            }

        }
        
    }
}

struct SplashScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreenView()
    }
}

