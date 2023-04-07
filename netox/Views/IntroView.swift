//
//  IntroView.swift
//  netox
//
//  Created by Linda belhadj on 6/4/2023.
//

import SwiftUI

struct IntroView: View {
   
    var body: some View {
        OnboardingScreen()
    }
}

struct IntroView_Previews: PreviewProvider {
    static var previews: some View {
        IntroView()
    }
}


//HOME SCREEN
struct Home: View {
    var body: some View {
        VStack {
            Text("Welcome to Home Screen")
                .font(.title)
                .fontWeight(.heavy)
        }
    }
}

struct OnboardingScreen: View {
    @State var isLinkActive = false
    
    var body: some View {
        ZStack {
            VStack{
                HStack{
                    Text("Hello")
                        .font(.title)
                        .fontWeight(.semibold)
                        .kerning(1.4)
                        .foregroundColor(Color("colorblue"))
                    
                    Spacer()
                    
                    Button(action: {}, label: {
                        Text("Skip")
                            .fontWeight(.semibold)
                            .foregroundColor(Color("colorblue"))
                            .kerning(1.2)
                    })
                }.padding()
                    .foregroundColor(.black)
                
                Spacer(minLength: 0)
                
                Image("imageintro")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(.horizontal, 8)
                
                
                Spacer(minLength: 80)
                
                Text("Kill your smartphone addiction")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .kerning(1.2)
                    .padding(.top)
                    .padding(.bottom,5)
                    .foregroundColor(Color("colorblue"))
                    .multilineTextAlignment(.center)
                
                Text("Take a DIGITL DETOX")
                    .font(.body)
                    .fontWeight(.regular)
                    .kerning(1.2)
                    .padding([.leading, .trailing])
                    .foregroundColor(Color("colorgreen"))
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                
                Spacer(minLength: 0)
                
                NavigationLink(destination: LoginView(), isActive: $isLinkActive) {
                    Button(action: {
                        self.isLinkActive = true
                    }, label: {
                        Text("Let's get started")
                            .fontWeight(.semibold)
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .padding()
                            .foregroundColor(.white)
                            .background(Color("colorblue"))
                            .cornerRadius(40)
                            .padding(.horizontal)
                        
                        
                    })
                }
               
            }
            
        }
            
    }
}

