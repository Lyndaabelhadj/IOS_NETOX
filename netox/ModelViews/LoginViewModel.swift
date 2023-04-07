//
//  SignUpView.swift
//  netox
//
//  Created by Linda on 05/04/2023.
//

import Alamofire

class LoginViewModel: ObservableObject {
    
    var loginRequest: LoginRequest?
    var errorMessage: String?
    
    func login(request: LoginRequest, completion: @escaping (Result<LoginResponse, Error>) -> ()) -> DataRequest {
        let url = "http://172.17.2.164:9090/user/login"

        do {
            let encodedRequest = try JSONEncoder().encode(request)
            var urlRequest = try URLRequest(url: url, method: .post)
            urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
            urlRequest.httpBody = encodedRequest
            
            return AF.request(urlRequest)
                .validate(statusCode: 200..<500)
                .validate(contentType: ["application/json"])
                .responseData { response in
                    switch response.result {
                        case .success(let data):
                            do {
                                let loginResponse = try JSONDecoder().decode(LoginResponse.self, from: data)
                                let user = loginResponse.user
                                print(response.result)// Utilisez cette ligne pour récupérer toutes les informations sur l'utilisateur
                                completion(.success(loginResponse))
                            } catch {
                                print(error)
                                completion(.failure(error))
                            }
                        case .failure(let error):
                        print(response.result)
                            completion(.failure(error))
                    }
                }
        } catch {
            print(error)
            completion(.failure(error))
        }
        // default return statement
        return AF.request(url)
    }
}
