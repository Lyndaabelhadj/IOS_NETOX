//
//  QuestionViewModel.swift
//  netox
//
//  Created by Linda BELHADJ  on 3/5/2023.
//

import Foundation
import Alamofire

//let userDefaultsKey = "accessToken"


class QuestionViewModel: ObservableObject {
    
    @Published var questions: [Question] = []
    // @Published var errorMessage: String = ""
    //  init(){
    //     fetchQuestion()
    //    print(question)
    //  }
    
    func fetchQuestion() {
        
        let headers: HTTPHeaders = ["Authorization": "Bearer \(UserDefaults.standard.string(forKey: "accessToken") ?? "")",            "Content-Type": "application/json"]
        
        
        AF.request("\(base_url)/Question", headers: headers).responseData{response in
            switch response.result {
            case .success(let data):
                do{
                    let decoder = JSONDecoder()
                    decoder.keyDecodingStrategy = .convertFromSnakeCase
                    self.questions = try decoder.decode([Question].self, from: data)
                    for question in self.questions {
                        print(question.contenu)
                    }
                }catch {
                    print("Failed to decode question response: \(error)")
                }
            case.failure(let error):
                print("Error fetching questions  \(error)")
            }
        }
        
    }
    
}
