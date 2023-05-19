//
//  ArticleDetailsView.swift
//  netox
//
//  Created by Linda BELHADJ  on 28/4/2023.
//

import SwiftUI
import CoreImage.CIFilterBuiltins


struct ArticleDetailsView: View {
    @State private var qrCodeData: String = ""

    var article: Article
    var body: some View {
      
            ZStack (alignment: .topLeading) {
            Color("colorgreen").ignoresSafeArea()
            
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
                    .multilineTextAlignment(.leading)
                    .lineLimit(nil)
                
               
                
                Link(destination: article.url, label: {
                    StandardButton(title: "Watch Now")
                    
                })
                
                QRCodeView(data: qrCodeData)
                            .frame(width: 100, height: 100).onAppear {
                                qrCodeData = "\(article.url)"
                            }
                
                //Link(destination: article.url, label: {
                  //  StandardButton(title: "Watch Now")
                    
               // })
            }
           
        }
        .navigationBarBackButtonHidden(false)
    }
}
        
struct StandardButton: View {
    var title: String
    var body: some View {
    
    Text(title)
        .bold()
        .font(.title)
        .frame(width: 280, height: 50)
        .background(Color("colorblue"))
        .foregroundColor(.white)
        .cornerRadius(10)
        .padding(.bottom, 60)
        
    }
}

        
         
struct QRCodeView: View {
    let data: String
    
    var body: some View {
        let filter = CIFilter.qrCodeGenerator()
        let data = Data(self.data.utf8)
        filter.setValue(data, forKey: "inputMessage")
        let ciImage = filter.outputImage
         
        let context = CIContext()
        guard let cgImage = context.createCGImage(ciImage!, from: ciImage!.extent) else {
            fatalError("Failed to create CGImage from CIImage.")
        }
        let uiImage = UIImage(cgImage: cgImage)
        
        return Image(uiImage: uiImage)
            .interpolation(.none)
            .resizable()
            .scaledToFit()
    }
}

struct ArticleDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        ArticleDetailsView(article: ArticleList.TopTen.first!)
    }
}
