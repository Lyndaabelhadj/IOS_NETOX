//
//  RdvView.swift
//  netox
//
//  Created by Linda BELHADJ  on 27/4/2023.
//


import SwiftUI

struct RdvView: View {
    @State private var date = Date()
    @State private var heure = Date()
    @State private var isPresented = false
    @State private var showDatePicker = false
    @State private var showHeurePicker = false
    @State var isLinkActiveApp = false 

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
                              
                                
                                
                                VStack {
                                    HStack {
                                        Button(action: {
                                            self.showDatePicker.toggle()
                                        }) {
                                            Text("Date of appointement")
                                                .padding(.horizontal, 20)
                                                .padding(.vertical, 8)
                                                .background(Color.gray.opacity(0.9))
                                                .cornerRadius(10)
                                                .foregroundColor(.white)
                                                .font(.system(size: 16, weight: .medium))
                                        }
                                        .padding(.bottom, 8)
                                        
                                        if showDatePicker {
                                            DatePicker(
                                                "",
                                                selection: $date,
                                                in: Date()..., // Définissez la plage de dates du système actuel vers l'infini
                                                displayedComponents: [.date]
                                            )
                                            .padding()
                                            .background(Color.gray.opacity(0.9))
                                            .cornerRadius(10)
                                            .foregroundColor(.white)
                                            .accentColor(.white)
                                            .font(.system(size: 16, weight: .medium))
                                         
                                        }
                                    }
                                }
                                .padding()
                                .background(Color.gray.opacity(0.1))
                                .cornerRadius(10)

                                
                                VStack {
                                    HStack {
                                        Button(action: {
                                            self.showHeurePicker.toggle()
                                        }) {
                                            Text("Time")
                                                .padding(.horizontal, 20)
                                                .padding(.vertical, 8)
                                                .background(Color.gray.opacity(0.9))
                                                .cornerRadius(10)
                                                .foregroundColor(.white)
                                                .font(.system(size: 16, weight: .medium))
                                        }
                                        .padding(.bottom, 8)
                                        
                                        if showHeurePicker {
                                            DatePicker(
                                                "",
                                                selection: $heure,
                                                displayedComponents: [.hourAndMinute] // Afficher uniquement le sélecteur d'heure
                                            )
                                            .labelsHidden() // Masquer les étiquettes
                                            .datePickerStyle(.wheel) // Utiliser le style de sélection de roue
                                            .padding()
                                            .background(Color.gray.opacity(0.9))
                                            .cornerRadius(10)
                                            .foregroundColor(.white)
                                            .accentColor(.white)
                                            .font(.system(size: 16, weight: .medium))
                                        }
                                    }
                                }
                                .padding()
                                .background(Color.gray.opacity(0.1))
                                .cornerRadius(10)

                                
                              
                           }
                            
                            NavigationLink(destination: PasswordUpdatedview().navigationBarBackButtonHidden()
                                , isActive: $isLinkActiveApp)
                            {
                                HStack(spacing: 20){
                                    
                                    Button(
                                        
                                        action: {
                                            let dateFormatter = DateFormatter()
                                            dateFormatter.dateFormat = "yyyy-MM-dd"
                                            let datede = dateFormatter.string(from: date)
                                            let dateFormatter1 = DateFormatter()
                                            dateFormatter1.dateFormat = "HH:mm"
                                            let heur = dateFormatter1.string(from: heure)
                                            
                                            let request = RdvRequest(date: datede,heure: heur)
                                            print(request)
                                            viewModel.addrdv(request: request) { result in
                                                switch result {
                                                case .success(let response):
                                                    // Handle successful sign up
                                                    print(response)
                                                    isPresented = false // set isPresented to false to dismiss the sheet
                                                   
                                                        isLinkActiveApp=true
                                                    print(isLinkActiveApp)
                                                case .failure(let error):
                                                    // Handle error
                                                    print(error.localizedDescription)
                                                }
                                            }
                                            
                                        }, label: {
                                            CustomButton(title: "Confirm", bgColor: "colorblue")
                                                .padding(.top, 10)
                                        })
                                    
                                    
                                }
                                
                                
                                
//                                NavigationLink(destination: HomeView(), isActive: $isLinkActive) {
//
//                                    Button(action: {
//                                        self.isLinkActive = true
//                                    }, label: {
//                                        CustomButton(title: "Cancel", bgColor: "colorblue")
//                                            .padding(.top, 10)
//                                    })
//                                }
                                
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
        
