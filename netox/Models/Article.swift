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
    Article(imageName: "netoxlogo",
            title: "How to enjoy a digital detox over Christmas",
            description: "It is not surprising that many of us have been suffering from digital overload during the pandemic, and taking care of our “digital wellbeing” has become a common theme. Social media, online shopping, making reservations, and even necessary chores like paying bills have meant that technology has pervaded every aspect of our lives...",
            url: URL(string: "https://theconversation.com/fr/topics/digital-detox-16181")!
    ),
    
    Article(imageName: "article1",
            title: "Digital detoxes are a solution looking for a problem",
            description: "The growing popularity of such “digital detoxes” is encouraged by a slew of negative findings about the effects of technology use, alongside claims that such action can help reduce stress and help people become more “present” and compassionate.",
            //uploadData: <#T##String#>,
            url: URL(string: "https://theconversation.com/fr/topics/digital-detox-16181")!
    ),
    
    Article(imageName: "article2",
            title: "We don’t need digital detox, but there is a need to rethink our relationship with technology",
            description: "We all know the scare stories. Growing numbers of people are becoming addicted to the internet and constantly checking their digital gadgets. They are steadily disconnecting us from real life, real relationships and real meaning. To this supposed problem of digital dependence, an antidote has been emerging: the “digital detox” retreat. Companies are advertising technology-free resorts, holiday packages, city breaks and summer camps.",
            //uploadData: <#T##String#>,
            url: URL(string: "https://theconversation.com/fr/topics/digital-detox-16181")!
    ),
    
    
    Article(imageName: "passwordupdated",
            title: "More of us are opting for ‘digital detox’ holidays",
            description: "John Briggs, a 40-year-old on holiday, texted his wife Shirley: “Look at the glacier out there.” He waited for the reply, which came through on his mobile. At the time they were sitting next to one another on board the deck of their small cruise ship, along northern Alaska’s icy shores.",
            //uploadData: <#T##String#>,
            url: URL(string: "https://theconversation.com/fr/topics/digital-detox-16181")!
    )
    
    ]
}
