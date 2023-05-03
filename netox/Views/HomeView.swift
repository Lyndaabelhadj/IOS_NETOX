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
        }) */
        ZStack{
            Color("colorblue")
                .ignoresSafeArea()
            //side menu
           SideMenu(selectedTab: $selectedTab)
        }
            
      
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}


// extending view to get screen size
extension View {
    func getRect()->CGRect{
        return UIScreen.main.bounds
    }
}
