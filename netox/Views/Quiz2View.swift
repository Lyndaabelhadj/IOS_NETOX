//
//  Quiz2View.swift
//  netox
//
//  Created by Linda BELHADJ  on 3/5/2023.
//

import SwiftUI

struct Quiz2View: View {
    @ObservedObject var QuestionsViewmodel = QuestionViewModel()
    @State private var selectedQuestion: Question? = nil
    @State private var birthMonth: DropdownMenuOption? = nil
    @StateObject var taskModel: QuestionNewViewModel = QuestionNewViewModel()

    var body: some View {
        NavigationView {
            ZStack(alignment: .topLeading) {
                VStack(spacing: 40) {
                    ZStack{
                        Ellipse()
                            .frame(width: 458, height: 420)
                            .padding(.trailing, -500)
                            .foregroundColor(Color("colorblue"))
                            .padding(.top, -200)
                    }

                    Text("Select a question")
                        .foregroundColor(.blue)
                        .font(.system(size: 35))
                        .fontWeight(.bold)
                        .multilineTextAlignment(.leading)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading,20)

                    ForEach(taskModel.questions, id: \.self){
                        question in
                            Text(question.contenu)
                                .font(.system(size: 10))

                        
                    }

                    Spacer()
                    Button(action: {
                        // handle button action
                    }, label: {
                        CustomButton(title: "Next", bgColor: "colorblue")
                    })
                }
                .padding(.horizontal, 20)
            }
            .navigationTitle("Questions")
        }
    }
}
struct Quiz2View_Previews: PreviewProvider {
      static var previews: some View {
          Quiz2View()
      }
  }

struct QuestionDetailView: View {
    let question: Question
    
    var body: some View {
        VStack {
            Text(question.contenu)
                .font(.headline)
          
        }
        .padding()
    }
}
