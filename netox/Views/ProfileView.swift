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
    @State var isLinkActivee = false
    @State var show = false
    @StateObject var loginViewModel = LoginViewModel()
    @StateObject var modelViewModel = ProfileViewModel()
    let userID = UserDefaults.standard.string(forKey: "userId")!

    //@State private var isDarkModeEnabled = false
    @State var isLinkActivebu = false
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
                            
                           
                            
                            Text("Welcome to \nyour profile")
                                .foregroundColor(.blue)
                                .font(.system(size: 35))
                                .fontWeight(.bold)
                                .multilineTextAlignment(.leading)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.leading,20)
                                .padding(.top, 100)
                                .transition(.opacity) // Animation de fondu
                            
                        }
                        VStack (spacing: 20){
                            VStack (spacing: 30){
                                CustomTextField(placeHolder: modelViewModel.user?.username ?? "username", imageName: "person", bColor: "textcolor2", tOpacity: 1.0, value: $name)
                                CustomTextField(placeHolder: modelViewModel.user?.email ?? "email", imageName: "envelope", bColor: "textcolor2", tOpacity: 1.0, value: $email)
                                
                            }
                            
                            
                        
                            VStack (alignment: .trailing){
                                NavigationLink(destination: ProfileUpdatedView(), isActive: $isLinkActivee) {
                                Button(action: {
                                    let request = UpdateUserRequest(username: name, email: email)
                                    modelViewModel.updateUser(userId1: userID ,request: request){
                                        self.isLinkActivee = true
                                    }
                                    
                                }, label: {
                                    CustomButton(title: "Save changes", bgColor: "colorblue")
                                        .padding(.top, 10)
                                    
                                })  }
                            } .padding(.horizontal, 10)
                            
                            
                            VStack (alignment: .trailing){
                            
                                NavigationLink(destination: HomeView(), isActive: $isLinkActivebu) {
                                    Button(action: {
                                        
                                        self.isLinkActivebu = true
                                    }, label: {
                                        CustomButton(title: "Cancel", bgColor: "colorblue")
                                            .padding(.bottom, 10)
                                    })}
                            } .padding(.horizontal, 10)
                            
                            //
                            
                            NavigationLink(destination: LoginView().navigationBarHidden(false),isActive: $show){
                                
                                
                                
                                
                            VStack (alignment: .trailing){
                                
                                Button(action: {
                                    self.show=true

                                    loginViewModel.logout()
                                    let loginView = LoginView()
                                    UIApplication.shared.windows.first?.rootViewController = UIHostingController(rootView: loginView)
                                    
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
        
//
//        Toggle("sombre",isOn: $isDarkModeEnabled)
//            .onChange(of: isDarkModeEnabled) { newValue in
//                if newValue {
//                    UIApplication.shared.windows.first?.overrideUserInterfaceStyle = .dark
//                }
//                else{
//                    UIApplication.shared.windows.first?.overrideUserInterfaceStyle = .light
//                }
//            }
        
    }
}
            
            struct ProfileView_Previews: PreviewProvider {
            static var previews: some View {
                ProfileView()
            }
        }
        
