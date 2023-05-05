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
    init(){
        fetchUser()
        print(user)
    }
    
    func fetchUser() {
        print("aaa")
        let url = "http://172.17.2.61:9095/user/645457d933c7642948002392"
        
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
                print("hhhhh")
                switch response.result {
                case .success(let user):
                    self.user = user
                case .failure(let error):
                    self.errorMessage = error.localizedDescription
                }
            }
    }
    
    func updateUser(request: UpdateUserRequest, completion: @escaping () -> Void) {
        let url = "http://172.17.2.61:9095/user/645457d933c7642948002392"
        
        guard let accessToken = UserDefaults.standard.string(forKey: userDefaultsKey) else {
            self.errorMessage = "Access Token not found"
            return
        }
        
        let headers: HTTPHeaders = [            "Authorization": "Bearer \(accessToken)",            "Content-Type": "application/json"        ]
        
        AF.request(url, method: .patch, parameters: request, encoder: JSONParameterEncoder.default, headers: headers)
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
