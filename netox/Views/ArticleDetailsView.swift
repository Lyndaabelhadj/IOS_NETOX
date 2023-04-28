//
//  ArticleDetailsView.swift
//  netox
//
//  Created by Linda BELHADJ  on 28/4/2023.
//

import SwiftUI

struct ArticleDetailsView: View {
    var article: Article
    var body: some View {
        NavigationView {
            
            
            VStack(spacing: 20){
                Spacer()
                Image(article.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 150)
                    .cornerRadius(12)
                
                Text(article.title)
                    .font(.title2)
                    .fontWeight(.semibold)
                    .lineLimit(12)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                
                Text(article.description)
                    .font(.body)
                    .padding()
                
                Spacer()
                
                Link(destination: article.url, label: {
                    StandardButton(title: "Watch Now")
                    
                })
            }
        }
        .navigationBarBackButtonHidden()
    }
}

struct StandardButton: View {
    var title: String
    var body: some View {
    
    Text(title)
        .bold()
        .font(.title)
        .frame(width: 280, height: 50)
        .background(Color(.systemRed))
        .foregroundColor(.white)
        .cornerRadius(10)
    }
}

struct ArticleDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        ArticleDetailsView(article: ArticleList.TopTen.first!)
    }
}
