//
//  ProfileViewModel.swift
//  netox
//
//  Created by Linda belhadj on 7/4/2023.
//

import Foundation
import Alamofire

let userDefaultsKey = "accessToken"


class ProfileViewModel: ObservableObject {
    
    
    
    @Published var user: User?
    @Published var errorMessage: String = ""
    var request: UpdateRdvRequest?
    let userID = UserDefaults.standard.string(forKey: "userId")!

    
    init(){
        fetchUser()
        print(user)
    }
    
    func fetchUser() {
        let url = "\(base_url)/user/\(userID)"
        
       /* guard let accessToken = UserDefaults.standard.string(forKey: userDefaultsKey) else {
            self.errorMessage = "Access Token not found"
            return
        }*/
        let accessToken = "l"
        let headers: HTTPHeaders = [            "Authorization": "Bearer \(accessToken)",            "Content-Type": "application/json"        ]

        
        AF.request(url, headers: headers)
            .validate(statusCode: 200..<300)
            .validate(contentType: ["application/json"])
            .responseDecodable(of: User.self) { response in
                switch response.result {
                case .success(let user):
                    self.user = user
                case .failure(let error):
                    self.errorMessage = error.localizedDescription
                }
            }
    }
    
    func updateUser(userId1: String ,request: UpdateUserRequest, completion: @escaping () -> Void) {
        let url = "\(base_url)/user/\(userId1)"
    
        
        AF.request(url, method: .patch, parameters: request, encoder: JSONParameterEncoder.default)
            .validate(statusCode: 200..<300)
            .validate(contentType: ["application/json"])
            .responseData { response in
                switch response.result {
                case .success(_):
                    completion()
                case .failure(let error):
                    self.errorMessage = error.localizedDescription
                }
            }
    }
}
