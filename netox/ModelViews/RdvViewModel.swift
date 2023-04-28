//
//  RdvViewModel.swift
//  netox
//
//  Created by Linda BELHADJ  on 27/4/2023.
//

import Foundation
import Alamofire

class RdvViewModel: ObservableObject {
    
    
    @Published var date: String = ""
    @Published var heure: String = ""
    
    @Published var rdvs = [rdv]()
    
    var rdvRequest: RdvRequest?
    var errorMessage: String?
    
    init () {
        self.getRdv()
    }
    
    func deleteRdv(id: String) {
        AF.request("http://172.168.167.33:9095/rdv/\(id)", method: .delete).validate().response { [weak self] response in
            switch response.result {
            case .success:
                self?.rdvs.removeAll { $0._id == id } // Remove the checklist from the array
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func addrdv(request: RdvRequest, completion: @escaping (Result<RdvResponse, Error>) -> ()) -> DataRequest {
        let url = "http://172.17.1.22:9095/rdv"
        
        do {
            let encodedRequest = try JSONEncoder().encode(request)
            let parameters = try JSONSerialization.jsonObject(with: encodedRequest, options: []) as? [String: Any]
            
            return AF.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: nil)
                .validate(statusCode: 200..<300)
                .validate(contentType: ["application/json"])
                .responseData { response in
                    switch response.result {
                    case .success(let data):
                        do {
                            let rdvResponse = try JSONDecoder().decode(RdvResponse.self, from: data)
                            completion(.success(rdvResponse))
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
    
    
    func getRdv() {
        fetchRdvs() { [weak self]  result in
            DispatchQueue.main.async {
                switch result {
                case .success(let rdvs):
                    self?.rdvs = rdvs
                    print(rdvs)
                    
                case .failure(let error):
                    print("error loading rdvs: \(error)")
                    //self?.state = .error(error.localizedDescription)
                }
            }
        }
        
    }
    
    
    func fetchRdvs( completion: @escaping(Result<[rdv],APIError>) -> Void) {
        let url = URL(string : "http://192.168.167.33:9092/rdv/user/642f9382de576283773909ba")
        //createURL(for:   .movie, page: nil, limit: nil)    fetch(type: [checklist].self, url: url, completion: completion)}
        func fetch<T: Decodable>(type: T.Type, url: URL?, completion: @escaping(Result<T,APIError>) -> Void) {
            guard let url = url else {
                let error = APIError.badURL
                completion(Result.failure(error))
                return
            }
            URLSession.shared.dataTask(with: url) { data, response, error in
                
                if let error = error as? URLError {
                    completion(Result.failure(APIError.urlSession(error))) }
                else if let response = response as? HTTPURLResponse, !(200...299).contains(response.statusCode) {
                    completion(Result.failure(APIError.badResponse(response.statusCode)))
                    
                }
                else if let data = data {
                    do {
                        let result = try JSONDecoder().decode(type, from: data)
                        completion(Result.success(result))
                    }
                    catch { completion(Result.failure(.decoding(error as? DecodingError)))
                    }
                }
                
            }.resume()}
        
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
