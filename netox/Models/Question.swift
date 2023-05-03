//
//  Question.swift
//  netox
//
//  Created by Linda BELHADJ  on 3/5/2023.
//

import Foundation

struct QuestionRequest: Encodable {
    let contenu: String
    let choix1: String
    let choix2: String
    let choix3: String
}


struct QuestionResponse: Decodable {
    let status: String
    let message: String
}
struct ErrorResponseQuestion: Decodable {
    let message: String
}

struct Question: Decodable {
    let contenu: String
    let choix1: String
    let choix2: String
    let choix3: String
    let __v: Int
    let _id: String
}

struct UpdateQuestionRequest: Encodable {
    let contenu: String?

}
