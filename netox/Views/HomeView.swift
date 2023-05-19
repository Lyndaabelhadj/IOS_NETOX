//
//  HomeView.swift
//  netox
//
//  Created by Linda belhadj on 7/4/2023.
//

import SwiftUI

struct HomeView: View {
    //selected tab
    @State var selectedTab = "Home"
    
    
    var body: some View {
       /* ZStack(alignment: .bottom, content: {
            Color("colorblue")
                .ignoresSafeArea()
            //Custom tabbar
            //CustomTabBarView(selectedTab: $selectedTab)
        })
        ZStack{
            Color("colorblue")
                .ignoresSafeArea()
            //side menu
           SideMenu(selectedTab: $selectedTab)
        }*/
          
        
        TabView{
            ArticleView()
                .tabItem(){
                    Image(systemName: "doc.text")
                    Text("Articles")
                }
            QuizView()
                .tabItem(){
                    Image(systemName: "questionmark.square.dashed")
                    Text("Quiz")
                }
            RdvView()
                .tabItem(){
                    Image(systemName: "briefcase")
                    Text("Appointment")
                }
           /* loclalisation()
                .tabItem(){
                   Image(systemName: "mappin")
                    Text("Localisation")
                }*/
            SettingsView()
                .tabItem(){
                    Image(systemName: "gear")
                    Text("Settings")
                }
            
        
            
        }.navigationBarBackButtonHidden()


      
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}


