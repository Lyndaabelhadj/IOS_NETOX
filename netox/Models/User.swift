//
//  User.swift
//  netox
//
//  Created by Linda belhadj on 7/4/2023.
//

import Foundation

/*struct SignupResponse: Decodable {
    let _id: String?
    let username: String?
    let email: String?
    let role: String?
    let datedenaissance: String?
    let numero: String?
    let password: String?
    let __v: Int=0
}
*/
struct SignupRequest: Encodable {
    let username: String
    let email: String
    let role: String
    let password: String
}

struct MessageResponse: Decodable {
    let message: String
}

struct SignupResponse: Decodable {
    let status: String
    let message: String
}
struct ErrorResponse: Decodable {
    let message: String
}

struct LoginRequest: Encodable {
    let username: String
    let password: String
}

struct LoginResponse: Decodable {
    let message: String
    let accessToken: String
    let user: User
}

struct SendMailRequest: Encodable {
    let email: String
}

struct VerifyCodeRequest: Encodable {
    let email: String
    let codeForget: String
}
struct ResetPasswordRequest: Encodable {
    let email: String
    let codeForget: String
    let password: String
}
struct ChangePasswordRequest: Encodable {
    let _id: String
    let username: String
    let email: String
    let password: String
    let newPassword: String
}

struct User: Decodable {
    let _id: String?
    let username: String
    let email: String
    let role: String
    let password: String
    let __v: Int
}

struct UpdateUserRequest: Encodable {
    let username: String?
    let email: String?
}

struct UpdateScoreResquest: Encodable , Decodable{
    let userId: String?
    let score: Int
}

struct UpdateScoreResponse: Encodable , Decodable{
    let _id: String
    let username: String
    let email: String
    let role: String
    let password: String
    let score: Int?
    let createdAt : String
    let updatedAt : String
    let __v: Int
    
}
struct UserChangePassword: Codable {
    let oldpassword: String = ""
    let newPassword: String = ""
    let email: String = ""

}
