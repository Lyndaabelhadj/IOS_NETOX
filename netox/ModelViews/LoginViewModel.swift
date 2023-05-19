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
    let userIdKey = "userId"
 
    @Published var test: Bool = false
    
    
    func logout(){
        UserDefaults.standard.set(false, forKey: "test")
        self.test = false
    }
    
    
    func login(request: LoginRequest, completion: @escaping (Result<LoginResponse, Error>) -> ()) -> DataRequest {
        let url = "\(base_url)/user/login"

        let userdefault = UserDefaults.standard
        
        do {
            let encodedRequest = try JSONEncoder().encode(request)
            var urlRequest = try URLRequest(url: url, method: .post)
            urlRequest.timeoutInterval = 30 // Définit le délai d'attente à 30 secondes
            
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
                                print(response.result)
                                UserDefaults.standard.set(loginResponse.user._id, forKey: self.userIdKey)
                                
                                self.test = true
                                userdefault.set(self.test, forKey: "test")
                            // Utilisez cette ligne pour récupérer toutes les informations sur l'utilisateur
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
