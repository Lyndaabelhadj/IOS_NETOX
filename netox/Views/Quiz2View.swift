//
//  Quiz2View.swift
//  netox
//
//  Created by Linda BELHADJ  on 3/5/2023.
//

import SwiftUI

struct Quiz2View: View {
    
    
    @State private var birthMonth: DropdownMenuOption? = nil
    
    var body: some View {
     
        NavigationView {
            
            ZStack (alignment: .topLeading) {
                
                VStack {
                    VStack (spacing: 40) {
                        ZStack{
                           
                        
                            Ellipse()
                                .frame(width: 458, height: 420)
                                .padding(.trailing, -500)
                                .foregroundColor(Color("colorblue"))
                                .padding(.top, -200)
                           
                            
                        }
                        
                        Text("hhhhhhhhhhh")
                            .foregroundColor(.blue)
                            .font(.system(size: 35))
                            .fontWeight(.bold)
                            .multilineTextAlignment(.leading)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.leading,20)
                        
                        
                        
                        DropdownMenu(
                            selectedOption: self.$birthMonth,
                            placeholder: "Select your birth month",
                            options: DropdownMenuOption.testAllMonths
                        )
                        
                        Spacer()
                        Button(action: {
                            // self.isLinkActive = true
                            
                        }, label: {
                            CustomButton(title: "Next", bgColor: "colorblue")
                                
                        })
                    }
                }.padding(.horizontal, 20)
                
                    
                
                    }

                    
                }
            }
            
    
        }
    


