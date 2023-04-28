//
//  HomeView.swift
//  netox
//
//  Created by Linda belhadj on 7/4/2023.
//

import SwiftUI

struct HomeView: View {
    
    @State var selectedTab = "house"
    
    var body: some View {
        ZStack(alignment: .bottom, content: {
            Color("colorblue")
                .ignoresSafeArea()
            
            //Custom tabbar
            CustomTabBarView(selectedTab: $selectedTab)
        })
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}


