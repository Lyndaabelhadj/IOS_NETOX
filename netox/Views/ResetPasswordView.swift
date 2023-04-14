//
//  ResetPasswordView.swift
//  netox
//
//  Created by Linda belhadj on 13/4/2023.
//

import SwiftUI

struct ResetPasswordView: View {
    @State private var email: String = ""

    @State var isLinkActive = false
    @State var isLinkActiveReset = false
    @State private var isPresented = false
    
    
    @ObservedObject var viewModel = SignupViewModel()


    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
      
        NavigationView {
            ZStack (alignment: .topLeading) {
                Color(.white).ignoresSafeArea()
                VStack {
                    VStack (spacing: 40) {
                        ZStack{
                            
                            
                            Ellipse()
                                .frame(width: 458, height: 420)
                                .padding(.trailing, -500)
                                .foregroundColor(Color("colorblue"))
                                .padding(.top, -200)
                            
                            Text("New \nCredentials")
                                .foregroundColor(Color("colorgreen"))
                                .font(.system(size: 35))
                                .fontWeight(.bold)
                                .multilineTextAlignment(.leading)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.leading,20)
                                .padding(.top, 100)
                         
                             
                        }
                        
                        Text("Create your new password for NETOX, so you can login to your account.")
                            .foregroundColor(Color("colorblue"))
                            .font(.system(size: 15))
                            .fontWeight(.bold)
                            .multilineTextAlignment(.leading)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.horizontal, 30)
                        
                        VStack (spacing: 20){
                            VStack (spacing: 30){
                                CustomTextField(placeHolder: "New Password", imageName: "lock", bColor: "textcolor2", tOpacity: 1.0, value: $email)
                                CustomTextField(placeHolder: "Confirm Password", imageName: "lock", bColor: "textcolor2", tOpacity: 1.0, value: $email)
                               
                            }
                            
                            
                            HStack(spacing: 20){
                                
                                NavigationLink(destination: PasswordUpdatedview(), isActive: $isLinkActiveReset) {
                                    Button(action: {
                                        self.isLinkActiveReset = true
                                    }, label: {
                                        CustomButton(title: "Save", bgColor: "colorgreen")
                                            .padding(.top, 10)
                                    }) }
                                
                                
                                NavigationLink(destination: LoginView(), isActive: $isLinkActive) {
                                    Button(action: {
                                        self.isLinkActive = true
                                    }, label: {
                                        CustomButton(title: "Cancel", bgColor: "colorgreen")
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

struct ResetPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        ResetPasswordView()
    }
}
