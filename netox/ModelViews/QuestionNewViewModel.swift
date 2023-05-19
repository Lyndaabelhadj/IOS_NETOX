//
//  QuestionViewModel.swift
//  netox
//
//  Created by Linda BELHADJ  on 3/5/2023.
//

import Foundation
import Alamofire

//let userDefaultsKey = "accessToken"


class QuestionNewViewModel: ObservableObject {
    @Published var questions: [QuestionNew] = []

    
    init (){
            self.getQuestions()
        print("2")
        }
    
    func UpdateScore1(request: UpdateScoreResquest ,completion: @escaping (Result<UpdateScoreResponse, Error>) -> ()) -> DataRequest {
            let url = "\(base_url)/user/score"
               
               do {
                   let encodedRequest = try JSONEncoder().encode(request)
                   var urlRequest = try URLRequest(url: url, method: .put)
                   urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
                   urlRequest.httpBody = encodedRequest
                   
                   return AF.request(urlRequest)
                       .validate(statusCode: 200..<500)
                       .validate(contentType: ["application/json"])
                       .responseData { response in
                           switch response.result {
                               case .success(let data):
                                   do {
                                       let UpdateScore = try JSONDecoder().decode(UpdateScoreResponse.self, from: data)
                                       completion(.success(UpdateScore))
                                       print(UpdateScore)
                                   } catch {
                                       print(error)
                                       completion(.failure(error))
                                   }
                               case .failure(let error):
                                   print(error)
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
    
        
        
        func getQuestions() {
            fetchQuestions() { [weak self]  result in
                DispatchQueue.main.async {
                    print("1")
                    switch result {
                    case .success(let question):
                        self?.questions = question
                        print(question)
                        
                    case .failure(let error):
                        print("error loading questions: \(error)")
                        //self?.state = .error(error.localizedDescription)
                    }
                }
            }
            
        }
    
    func fetchQuestions( completion: @escaping(Result<[QuestionNew],APIError>) -> Void) {
        
            let url = URL(string : "\(base_url)/QuestionNew/")
            print(url)
            //createURL(for:   .movie, page: nil, limit: nil)
            fetch(type: [QuestionNew].self, url: url, completion: completion)
        }
    
    func fetch<T: Decodable>(type: T.Type, url: URL?, completion: @escaping(Result<T,APIError>) -> Void) {
            
            guard let url = url else {
                let error = APIError.badURL
                completion(Result.failure(error))
                return
            }
            
            URLSession.shared.dataTask(with: url) { data, response, error in
                
                if let error = error as? URLError {
                    completion(Result.failure(APIError.urlSession(error)))
                } else if let response = response as? HTTPURLResponse, !(200...299).contains(response.statusCode) {
                    completion(Result.failure(APIError.badResponse(response.statusCode)))
                } else if let data = data {
                    
                    do {
                        let result = try JSONDecoder().decode(type, from: data)
                        completion(Result.success(result))
                    } catch {
                        completion(Result.failure(.decoding(error as? DecodingError)))
                    }
                }
            }.resume()
        }
    
    
    enum APIError: Error, CustomStringConvertible {
            
            case badURL
            case urlSession(URLError?)
            case badResponse(Int)
            case decoding(DecodingError?)
            case unknown
            
            var description: String {
                switch self {
                case .badURL:
                    return "badURL"
                case .urlSession(let error):
                    return "urlSession error: \(error.debugDescription)"
                case .badResponse(let statusCode):
                    return "bad response with status code: \(statusCode)"
                case .decoding(let decodingError):
                    return "decoding error: \(decodingError)"
                case .unknown:
                    return "unknown error"
                }
            }
            
            var localizedDescription: String {
                switch self {
                case .badURL, .unknown:
                    return "something went wrong"
                case .urlSession(let urlError):
                    return urlError?.localizedDescription ?? "something went wrong"
                case .badResponse(_):
                    return "something went wrong"
                case .decoding(let decodingError):
                    return decodingError?.localizedDescription ?? "something went wrong"
                }
            }
        }
    
}

