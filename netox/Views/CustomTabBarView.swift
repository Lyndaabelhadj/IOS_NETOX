//
//  CustomTabBarView.swift
//  netox
//
//  Created by Linda belhadj on 7/4/2023.
//

import SwiftUI

struct CustomTabBarView: View {
    @Binding var selectedTab: String
    
    var body: some View {
        HStack(spacing: 0){
            
            //tab bar button
        TabBarButton(image: "house", selectedTab: $selectedTab)
        TabBarButton(image: "quiz", selectedTab: $selectedTab)
        TabBarButton(image: "profile", selectedTab: $selectedTab)
        TabBarButton(image: "house", selectedTab: $selectedTab)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(30)
        .padding(.horizontal)
    }
}

struct CustomTabBarView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

struct TabBarButton: View {
    var image: String
    @Binding var selectedTab: String
    
    var body: some View {
        //animation
        GeometryReader {
            reader in
            Button(action: {
                
                //changing tab
                withAnimation{
                    selectedTab = image
                }
                
            }, label: {
                
                Image(systemName: "\(image)\(selectedTab == image ? ".fill" : "")")
                    .font(.system(size: 25,weight: .semibold))
                    .foregroundColor(Color("colorblue"))
                    //lifting view
                //if its selected
                    .offset(y:selectedTab == image ? -10 : 0)
            })
            //max frame
                .frame(width: .infinity, height: .infinity)
        }
        //max height
        .frame(height: 50)
    }
}
