//
//  LoginView.swift
//  netox
//
//  Created by Linda on 05/04/2023.
//

import SwiftUI
import LocalAuthentication

struct LoginView: View {
    @StateObject var loginViewModel = LoginViewModel()
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var isPasswordVisible = false
    @State private var loginSuccess = false
    @State private var redirectToHomePage = false
    @State var isLinkActive = false
    @State var showHomePageView = false
    @State var isUnlocked = false
    @State var isLinkActiveforgetpass = false
    
    
    
    @Environment (\.presentationMode) var presentationMode
    
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
                            
                            Text("Welcome \nto NETOX")
                                .foregroundColor(.white)
                                .font(.system(size: 35))
                                .fontWeight(.bold)
                                .multilineTextAlignment(.leading)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.leading,20)
                         
                            
                        }
                        VStack (spacing: 30){
                            VStack (spacing: 30){
                                CustomTextField(placeHolder: "username", imageName: "envelope", bColor: "textcolor2", tOpacity: 1.0, value: $username)
                                CustomTextField(placeHolder: "Password", imageName: "lock", bColor: "textcolor2", tOpacity: 1.0, value: $password)
                            }
                     
                            
                            VStack {
                              
                                NavigationLink(destination: ForgetPasswordView(), isActive: $isLinkActiveforgetpass) {
                                  Text("Forget Password ?")
                                        .fontWeight(.medium)
                               }

                                
                                NavigationLink(destination: HomeView(), isActive: $loginSuccess) {
                                    
                                    Button(action: {
                                       // self.isLinkActive = true
                                       print(username)
                                        print(password)
                                        let request = LoginRequest(username: username, password: password)
                                        print(request)
                                        loginViewModel.login(request: request) { result in
                                            switch result {
                                            case .success(let response):
                                                // Action si la connexion est réussie
                                                print(response)
                                                self.loginSuccess = true // Set login success to true
                                               

                                                self.redirectToHomePage = true // Set redirectToHomePage to true
                                            case .failure(let error):
                                                
                                                // Action si la connexion échoue
                                                print(error)
                                            }
                                        }
                                    }, label: {
                                        CustomButton(title: "SIGN IN", bgColor: "colorblue")
                                            .padding(.top, 10)
                                    })
                                }
                            }.padding(.horizontal, 20)
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
                                        
                                        
                                        VStack{
                                            if isUnlocked {
                                                NavigationLink("", destination: HomeView(), isActive: $showHomePageView)
                                            }else {
                                                Image(systemName: "faceid")
                                                    .resizable()
                                                    .frame(width: 50,height: 50)
                                                    .foregroundColor(.black)
                                                    .padding(.top,100)
                                                    .onTapGesture {
                                                        authenticateWithBiometrics()
                                                       
                                                    }
                                            }
                                        }
                                        
                                        Spacer()
                                        
                                        Button(action: {}, label: {
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
                        Text("Don't have an account?")
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .font(.system(size: 18))
                        
                        NavigationLink(destination: SignUpView(), isActive: $isLinkActive) {
                            Button(action: {
                                self.isLinkActive = true
                            }, label: {
                                Text("SIGN UP")
                                    .font(.system(size: 18))
                                    .foregroundColor(.white)
                                    .fontWeight(.bold)
                            })
                        }
                    }
                    .frame(height: 63)
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .background(Color("colorgreen"))
                    .ignoresSafeArea()
                }
                
            }
            .edgesIgnoringSafeArea(.bottom)
        }
        .navigationBarBackButtonHidden()
        
        
        
    }
    private func authenticateWithBiometrics() {
                let context = LAContext()
                var error: NSError?
                
                if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
                    let reason = "Log in with Face ID"
                    context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, error in
                        if success {
                            DispatchQueue.main.async {
                                isUnlocked = true
                                showHomePageView = true
                            }
                        } else {
                            DispatchQueue.main.async {
                                let alertController = UIAlertController(title: "Authentication Failed", message: error?.localizedDescription ?? "Please try again", preferredStyle: .alert)
                                let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                                alertController.addAction(okAction)
                                // You can present an alert in SwiftUI using an Alert view
                                // Alternatively, you can use a Text view and set the text to the error message
                                // You can also use a Toast view to show a brief message at the bottom of the screen
                                // Example:
                                // showAlert = true
                                // alertMessage = error?.localizedDescription ?? "Please try again"
                            }
                        }
                    }
                } else {
                    let alertController = UIAlertController(title: "Face ID Not Available", message: error?.localizedDescription ?? "Your device does not support Face ID", preferredStyle: .alert)
                    let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                    alertController.addAction(okAction)
                    // Same as above
                }
            }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}



