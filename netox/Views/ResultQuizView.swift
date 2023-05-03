//
//  ResultQuizView.swift
//  netox
//
//  Created by Linda BELHADJ  on 3/5/2023.
//

import SwiftUI

struct ResultQuizView: View {
    var body: some View {
   
        ZStack{
            Ellipse()
                .frame(width: 350, height: 340)
                .padding(.leading, -400)
                .foregroundColor(Color("colorgreen"))
                .padding(.top, -500)
        
            Ellipse()
                .frame(width: 440, height: 420)
                .padding(.trailing, -700)
                .foregroundColor(Color("colorblue"))
                .padding(.bottom, -800)
            
                VStack {
                    Image(systemName: "gamecontroller.fill")
                        .foregroundColor(Color.yellow)
                        .font(.system(size: 60))
                        .padding(.bottom, 20)
                    
                  
                    Button {
                      
                    } label: {
                        HStack {
                            Image(systemName: "play.fill")
                                .foregroundColor(.white)
                                .font(.system(size: 24))
                                .padding()
                            
                            Text("Your result is :")
                                .foregroundColor(.white)
                                .font(.system(size: 24, weight: .bold, design: .rounded))
                        }
                    }.frame(width: 300, height: 60, alignment: .center)
                        .background(.blue.opacity(0.7))
                        .cornerRadius(30)
                        .padding()
                    
                }.padding(.bottom,10)
        }
    }
}

struct ResultQuizView_Previews: PreviewProvider {
    static var previews: some View {
        ResultQuizView()
    }
}
