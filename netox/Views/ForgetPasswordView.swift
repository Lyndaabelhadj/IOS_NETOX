//
//  ForgetPasswordView.swift
//  netox
//
//  Created by Linda belhadj on 13/4/2023.
//

import SwiftUI

struct ForgetPasswordView: View {
    
    @State private var email: String = ""
    @StateObject var forgetPasswordViewModel = ForgetPasswordViewModel()
    @State var isLinkActive = false
    @State private var isPresented = false
    
    
    @ObservedObject var viewModel = SignupViewModel()


    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
      
        NavigationView {
            ZStack (alignment: .topLeading) {
                Color("colorgreen").ignoresSafeArea()
                VStack {
                    VStack (spacing: 40) {
                        ZStack{
                            
                            
                            Ellipse()
                                .frame(width: 458, height: 420)
                                .padding(.trailing, -500)
                                .foregroundColor(Color("colorblue"))
                                .padding(.top, -200)
                            
                            Text("Forget \nPassword")
                                .foregroundColor(Color("colorblue"))
                                .font(.system(size: 35))
                                .fontWeight(.bold)
                                .multilineTextAlignment(.leading)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.leading,20)
                                .padding(.top, 100)
                         
                             
                        }
                        
                        Text("Provide your account's email for which you want to reset your password.")
                            .foregroundColor(.white)
                            .font(.system(size: 15))
                            .fontWeight(.bold)
                            .multilineTextAlignment(.leading)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.horizontal, 30)
                        
                        VStack (spacing: 20){
                            VStack (spacing: 30){
                                CustomTextField(placeHolder: "Enter your email", imageName: "envelope", bColor: "textcolor2", tOpacity: 1.0, value: $email)
                                    .onChange(of: forgetPasswordViewModel.email) { value in
                                        forgetPasswordViewModel.validateEmail()
                                    }
                            }
                            
                            
                            HStack(spacing: 20){
                            
                                Button(action: {
                                    
                                }, label: {
                                    CustomButton(title: "Send", bgColor: "colorblue")
                                        .padding(.top, 10)
                                })
                                
                                NavigationLink(destination: LoginView(), isActive: $isLinkActive) {
                                    
                                    Button(action: {
                                        self.isLinkActive = true
                                    }, label: {
                                        CustomButton(title: "Cancel", bgColor: "colorblue")
                                            .padding(.top, 10)
                                    })
                                }
                            } .padding(.horizontal, 20)
                                    
                            
                                    .padding(.horizontal, 10)
                                
                        }
                    }
                    
                    Spacer()
                    
                    
                                        
                    
                    
                    HStack {
                    }
                    .frame(height: 63)
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .background(Color("colorblue"))
                    .ignoresSafeArea()
                }
                TopBarView()
            }
            .edgesIgnoringSafeArea(.bottom)
        }
        .navigationBarHidden(true)
        
        
        
    }
}

struct ForgetPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        ForgetPasswordView()
    }
}
