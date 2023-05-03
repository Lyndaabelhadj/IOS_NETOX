//
//  RdvView.swift
//  netox
//
//  Created by Linda BELHADJ  on 27/4/2023.
//


import SwiftUI

struct RdvView: View {
    @State private var date: String = ""
    @State private var heure: String = ""
    @State private var isPresented = false
    @State var isLinkActive = false
    
    @ObservedObject var viewModel = RdvViewModel()
    @Environment(\.presentationMode) var presentationMode
    
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
                            
                            Text("Make an \nappointment")
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
                                CustomTextField(placeHolder: "Date", imageName: "rdv", bColor: "textcolor2", tOpacity: 1.0, value: $date)
                                CustomTextField(placeHolder: "Heure", imageName: "time", bColor: "textcolor2", tOpacity: 1.0, value: $heure)
                        
                            }
                            
                            
                            
                            HStack(spacing: 20){
                            
                                Button(
                                   
                                action: {
                                   
                                        let request = RdvRequest(date: date,heure: heure)
                                        print(request)
                                    viewModel.addrdv(request: request) { result in
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
                                    CustomButton(title: "Confirm", bgColor: "colorblue")
                                        .padding(.top, 10)
                                })
                                
                                NavigationLink(destination: HomeView(), isActive: $isLinkActive) {
                                    
                                    Button(action: {
                                        self.isLinkActive = true
                                    }, label: {
                                        CustomButton(title: "Cancel", bgColor: "colorblue")
                                            .padding(.top, 10)
                                    })
                                }
                                
                            } .padding(.horizontal, 20)
                        
                                .padding(.vertical, 70)
                        }
                    }
                    
                    
                }
            }
            .edgesIgnoringSafeArea(.bottom)
        }
        .navigationBarHidden(false)
        
        
        
    }
}
            
            struct RdvView_Previews: PreviewProvider {
            static var previews: some View {
                RdvView()
            }
        }
        
