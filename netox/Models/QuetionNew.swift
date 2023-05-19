//
//  Question.swift
//  netox
//
//  Created by Linda BELHADJ  on 3/5/2023.
//

import Foundation

struct QuestionNewRequest: Encodable {
    let contenu: String
}


struct QuestionNewResponse: Decodable {
    let status: String
    let message: String
}
struct ErrorResponseQuestionNew: Decodable {
    let message: String
}

struct QuestionNew:  Codable, Hashable ,Identifiable {
    var id: String {_id}
    let _id: String
    let contenu: String
    let __v: Int
}

struct UpdateQuestionNewRequest: Encodable {
    let contenu: String?

}
