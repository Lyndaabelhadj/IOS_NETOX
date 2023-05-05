//
//  ProfileView.swift
//  netox
//
//  Created by Linda belhadj on 6/4/2023.
//

import SwiftUI

struct ProfileView: View {
    @State private var name: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var cpassword: String = ""
    @State var isLinkActive = false
    @State var show = false
    @StateObject var loginViewModel = LoginViewModel()
    @StateObject var modelViewModel = ProfileViewModel()
    
    var body: some View {
    
        NavigationView {
            ZStack (alignment: .topLeading) {
                
                VStack {
                    VStack (spacing: 40) {
                        ZStack{
                            
                            Ellipse()
                                .frame(width: 510, height: 478)
                                .padding(.leading, -200)
                                .foregroundColor(Color("colorgreen"))
                                .padding(.top, -200)
                            
                            Ellipse()
                                .frame(width: 458, height: 420)
                                .padding(.trailing, -500)
                                .foregroundColor(Color("colorblue"))
                                .padding(.top, -200)
                            
                            Text("Welcome to \nyour profile")
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
                                CustomTextField(placeHolder: modelViewModel.user?.username ?? "username", imageName: "person", bColor: "textcolor2", tOpacity: 1.0, value: $name)
                                CustomTextField(placeHolder: modelViewModel.user?.email ?? "email", imageName: "envelope", bColor: "textcolor2", tOpacity: 1.0, value: $email)
                                
                            }
                            
                            
                            VStack (alignment: .trailing){
                                
                                Button(action: {
                                    
                                    
                                    
                                }, label: {
                                    CustomButton(title: "confirm", bgColor: "colorblue")
                                        .padding(.top, 10)
                                    
                                })
                            } .padding(.horizontal, 10)
                            
                            
                            VStack (alignment: .trailing){
                                
                                Button(action: {
                                    
                                    
                                }, label: {
                                    CustomButton(title: "Cancel", bgColor: "colorblue")
                                        .padding(.bottom, 10)
                                })
                            } .padding(.horizontal, 10)
                            
                            //
                            
                            NavigationLink(destination: LoginView().navigationBarHidden(true),isActive: $show){
                                
                            VStack (alignment: .trailing){
                                
                                Button(action: {
                                    self.show=true

                                    loginViewModel.logout()
                                    
                                }, label: {
                                    CustomButton(title: "Logout", bgColor: "colorgreen")
                                        .padding(.bottom, 220)
                                })
                            } .padding(.horizontal, 10)
                        }
                        }
                    }
                   
                    
                }
            }
            .edgesIgnoringSafeArea(.bottom)
        }
        .navigationBarBackButtonHidden()
        
        
        
    }
}
            
            struct ProfileView_Previews: PreviewProvider {
            static var previews: some View {
                ProfileView()
            }
        }
        
