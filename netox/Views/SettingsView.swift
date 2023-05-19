//
//  SettingsView.swift
//  netox
//
//  Created by Bout de choux on 18/5/2023.
//

import SwiftUI

struct SettingsView: View {
    
    @State var isLinkActivee = false
    @State var isLinkActiveLoc = false
    
    var body: some View {
        
        NavigationView(){
            VStack (alignment: .trailing){
                NavigationLink(destination: ProfileView(), isActive: $isLinkActivee) {
                    Button(action: {
                        self.isLinkActivee = true
                        
                    }, label: {
                        CustomButton(title: "Update your profile", bgColor: "colorblue")
                            .padding(.top, 10)
                        
                    })  }
                
                NavigationLink(destination: localisationView(tt: []), isActive: $isLinkActiveLoc) {
                    Button(action: {
                        
                        self.isLinkActiveLoc = true
                    }, label: {
                        CustomButton(title: "About me", bgColor: "colorblue")
                            .padding(.bottom, 10)
                    })}
            } .padding(.horizontal, 10)
            
            
            
        }
        
        
    }
    
    struct SettingsView_Previews: PreviewProvider {
        static var previews: some View {
            SettingsView()
        }
    }
}
