//
//  QuizView.swift
//  netox
//
//  Created by Linda belhadj on 13/4/2023.
//

import SwiftUI

struct QuizView: View {
    @State private var showingLoginView = false
    
    var body: some View {
        NavigationView {
            ZStack{
                
                Image("quizimage")
                    .resizable()
                    .scaledToFit()
                    .edgesIgnoringSafeArea(.all)
                
                VStack(spacing : 20) {
                    
                    Text("NETOX Quiz")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(Color("colorblue"))
                        
                    
                    Text("Are you ready to test your level of addiction ?")
                        .font(.title)
                    
                    Spacer()
                    
                    NavigationLink(destination: Test(), isActive: $showingLoginView) {
                        Text("Let's start")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .background(Color("colorblue"))
                            .cornerRadius(10)
                            .onTapGesture {
                                showingLoginView = true
                            }
                            .padding(.top, 100)
                    }
                }
                .padding()
            }
        }}}

struct QuizView_Previews: PreviewProvider {
    static var previews: some View {
        QuizView()
    }
}
