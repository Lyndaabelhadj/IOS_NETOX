//
//  Article.swift
//  netox
//
//  Created by Linda BELHADJ  on 27/4/2023.
//

import Foundation

struct Article : Identifiable {
    let id = UUID()
    let imageName: String
    let title: String
    let description: String
    let url: URL
    
}

struct ArticleList {
    
    static let TopTen = [
    Article(imageName: "article3",
            title: "How to enjoy a digital detox over Christmas",
            description: "It is not surprising that many of us have been suffering from digital overload during the pandemic, and taking care of our “digital wellbeing” has become a common theme.",
            url: URL(string: "https://theconversation.com/fr/topics/digital-detox-16181")!
    ),
    
    Article(imageName: "article1",
            title: "Digital detoxes are a solution looking for a problem",
            description: "The growing popularity of such “digital detoxes” is encouraged by a slew of negative findings about the effects of technology use, alongside claims that such action can help reduce stress and help people become more “present” and compassionate.",
            //uploadData: <#T##String#>,
            url: URL(string: "https://theconversation.com/digital-detoxes-are-a-solution-looking-for-a-problem-106460")!
    ),
    
    Article(imageName: "article4",
            title: "A need to rethink our relationship with technology",
            description: "We all know the scare stories. Growing numbers of people are becoming addicted to the internet and constantly checking their digital gadgets.",
            //uploadData: <#T##String#>,
            url: URL(string: "https://theconversation.com/fr/topics/digital-detox-16181")!
    ),
    
    
    Article(imageName: "passwordupdated",
            title: "More of us are opting for ‘digital detox’ holidays",
            description: "John Briggs, a 40-year-old on holiday, texted his wife Shirley: “Look at the glacier out there.” He waited for the reply, which came through on his mobile.",
            //uploadData: <#T##String#>,
            url: URL(string: "https://theconversation.com/fr/topics/digital-detox-16181")!
    )
    
    ]
}
