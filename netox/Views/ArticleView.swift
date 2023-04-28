//
//  ArticleView.swift
//  netox
//
//  Created by Linda BELHADJ  on 27/4/2023.
//

import SwiftUI

struct ArticleView: View {
    var articles: [Article] = ArticleList.TopTen
    var body: some View {
        NavigationView{
            
            List(articles, id: \.id) { article in
                //HStack {
                NavigationLink(destination: {
                    ArticleDetailsView(article: article)
                }, label: {
                    
                   ArticleCell(article: article)
                }
                )
            }
            .navigationTitle("Articles")
        }
     
    }
}


struct ArticleCell: View {
    var article: Article
    var body: some View {
        HStack{
        Image(article.imageName)
            .resizable()
            .scaledToFit()
            .frame(height: 70)
            .cornerRadius(4)
            .padding(.vertical,4)
        
            VStack (alignment: .leading, spacing: 3){
                Text(article.title)
                    .fontWeight(.semibold)
                    .lineLimit(2)
                    .minimumScaleFactor(0.5)
                
                Text(article.description)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                
            }
        }
    }
}

struct ArticleView_Previews: PreviewProvider {
    static var previews: some View {
        ArticleView()
    }
}
