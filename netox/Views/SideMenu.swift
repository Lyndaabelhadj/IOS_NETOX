//
//  SideMenu.swift
//  netox
//
//  Created by Linda BELHADJ  on 3/5/2023.
//

import SwiftUI

struct SideMenu: View {
    @Binding var selectedTab : String
    @Namespace var animation
    
    var body: some View {
        
       
        
        VStack(alignment: .leading,spacing: 15, content: {
            //profile pic
            Image("article1")
                .resizable()
                .aspectRatio( contentMode: .fill)
                .frame(width: 70, height: 70)
                .cornerRadius(10)
            //padding top for top close button
                .padding(.top,50)
            
            VStack(alignment: .leading,spacing: 6, content: {
                Text("linda belhadj")
                    .font(.title)
                    .fontWeight(.heavy)
                    .foregroundColor(.white)
                Button(action: {}, label: {
                    Text("View profile")
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .opacity(0.7)
                })

            })
            
            //tab buttons
            VStack(alignment: .leading, spacing: 10){
                TabButton(image: "house", title: "Home", selectedTab: $selectedTab, animation: animation)
                
                TabButton(image: "house", title: "Profile", selectedTab: $selectedTab, animation: animation)
                
                TabButton(image: "gearshape", title: "Quiz", selectedTab: $selectedTab, animation: animation)
                
                TabButton(image: "questionmark.circle", title: "Article", selectedTab: $selectedTab, animation: animation)
            }
            .padding(.leading, -15)
            .padding(.top, 50)
            
            Spacer()
            
            //sign out button
            VStack(alignment: .leading, content: {
                TabButton(image: "rectangle.righthalf.inset.fill.arrow.right", title: "Log out", selectedTab: .constant(""), animation: animation)
                    .padding(.leading, -15)
            })
            
            
        }).padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        
        
    }
}

struct SideMenu_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
