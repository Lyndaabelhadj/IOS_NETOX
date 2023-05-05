//
//  SignUpView.swift
//  netox
//
//  Created by Linda on 05/04/2023.
//

import SwiftUI

struct SignUpView: View {
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var email: String = ""
    @State private var role: String = "user"
    @State private var cpassword: String = ""
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
                            
                            Text("Create \nAccount")
                                .foregroundColor(.white)
                                .font(.system(size: 35))
                                .fontWeight(.bold)
                                .multilineTextAlignment(.leading)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.leading,20)
                                .padding(.top, 100)
                         
                             
                        }
                        VStack (spacing: 20){
                            VStack (spacing: 30){
                                CustomTextField(placeHolder: "Username", imageName: "person", bColor: "textcolor2", tOpacity: 1.0, value: $username)
                                CustomTextField(placeHolder: "Email", imageName: "envelope", bColor: "textcolor2", tOpacity: 1.0, value: $email)
                                CustomTextField(placeHolder: "Password", imageName: "lock", bColor: "textcolor2", tOpacity: 1.0, value: $password)
                                CustomTextField(placeHolder: "Confirm Password", imageName: "lock", bColor: "textcolor2", tOpacity: 1.0, value: $cpassword)
                            }
                            
                            
                            VStack (alignment: .trailing){
                                
                                
                                Button(action: {
            
                                    let request = SignupRequest(username: username,email: email,role: role, password: password)
                                    print(request)
                                    viewModel.signup(request: request) { result in
                                        switch result {
                                        case .success(let response):
                                            // Handle successful sign up
                                            print(response)
                                            // Dismiss the sign in view after successful sign up
                                            presentationMode.wrappedValue.dismiss()
                                            
                                            // Redirect to login page
                                            presentationMode.wrappedValue.dismiss() // dismiss the current view
                                            isPresented = false // set isPresented to false to dismiss the sheet
                                            
                                        case .failure(let error):
                                            // Handle error
                                            print(error.localizedDescription)
                                        }
                                    }
                                }, label: {
                                    CustomButton(title: "SIGN UP", bgColor: "colorblue")
                                        .padding(.top, 10)
                                })
                                
                               
                                
                            } .padding(.horizontal, 20)
                                    
                                    HStack {
                                        Button(action: {}, label: {
                                            Image("fb")
                                                .resizable()
                                                .frame(width: 30,height: 30)
                                                .padding(.horizontal, 15)
                                                .padding(.vertical, 15)
                                                .background(Color("colorgreen"))
                                                .cornerRadius(15)
                                                
                                        })
                                        
                                        
                                        Spacer()
                                        
                                        Button(action: {
                                            
                                        }, label: {
                                            Image("gmail")
                                                .resizable()
                                                .frame(width: 30,height: 30)
                                                .padding(.horizontal, 15)
                                                .padding(.vertical, 15)
                                                .background(Color("colorgreen"))
                                                .cornerRadius(15)
                                        })
                                        
                                    }
                                    .padding(.horizontal, 110)
                                
                        }
                    }
                    
                    Spacer()
                    
                    HStack {
                        Text("Already have an account?")
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .font(.system(size: 18))
                        NavigationLink(destination: LoginView(), isActive: $isLinkActive) {
                            Button(action: {
                                self.isLinkActive = true
                            }, label: {
                                Text("SIGN IN")
                                    .font(.system(size: 18))
                                    .foregroundColor(.white)
                                    .fontWeight(.bold)
                            })
                        }
                    }
                    .frame(height: 63)
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .background(Color("colorblue"))
                    .ignoresSafeArea()
                }
                
            }
            .edgesIgnoringSafeArea(.bottom)
        }
        //.navigationBarHidden(true)
        
        .navigationBarBackButtonHidden()
        
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
