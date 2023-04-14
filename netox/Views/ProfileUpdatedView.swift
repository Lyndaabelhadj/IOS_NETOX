//
//  ProfileUpdatedView.swift
//  netox
//
//  Created by Linda belhadj on 14/4/2023.
//

import SwiftUI

struct ProfileUpdatedView: View {
        @State private var isHomeViewActive = false // État pour gérer la navigation vers la vue de connexion
    var body: some View {
        ZStack { // Utilisation de ZStack pour superposer l'image et le contenu
            Image("profileupdated") // Remplacez "backgroundImage" par le nom de votre image d'arrière-plan
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            VStack(spacing: 20) {
                Image(systemName: "checkmark.circle") // Icône de succès
                    .font(.system(size: 100))
                    .foregroundColor(.green)
                Text("Profile Updated")
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(.black)
                Text("Your Profile has been updated.")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 40)
                Button(action: {
                    // Action du bouton Login
                    // Ajoutez ici le code pour rediriger vers la page de connexion
                    self.isHomeViewActive = true
                }) {
                    Text("Home")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color("colorgreen"))
                        .cornerRadius(10)
                }
                .padding(.horizontal, 40)
                // Lien de navigation vers la vue de connexion
                .sheet(isPresented: $isHomeViewActive) {
                    HomeView()
                }
            }
            
            .padding()
            .background(Color.white)
            .cornerRadius(20)
            .shadow(radius: 5)
            .padding(40)
        }
    }
    }
    


struct ProfileUpdatedView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileUpdatedView()
    }
}
