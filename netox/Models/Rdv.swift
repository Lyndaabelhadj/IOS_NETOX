//
//  Rdv.swift
//  netox
//
//  Created by Linda BELHADJ  on 27/4/2023.
//

import Foundation
struct RdvRequest: Encodable {
    let date: String
    let heure: String
   
}

struct RdvResponse: Decodable {
    let message: String
}

struct ErrorResponse1: Decodable {
    let message: String
}


struct rdv: Decodable, Hashable {
    let _id: String
    let date: String
    let heure: String
    let __v: Int
}

struct UpdateRdvRequest: Encodable {
    let date: String
    let heure: String
}

