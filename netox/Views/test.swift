//
//  Home.swift
//  TaskManager
//
//  Created by OmarKaabi on 8/5/2023.
//

import SwiftUI

struct Test: View {
    
    @StateObject var taskModel: QuestionNewViewModel = QuestionNewViewModel()
    @State var list : [String] = ["YES","NO","MAYBE"]
    @State private var showActionSheet = false
    @State var score1 : Int = 0;
    @State private var showSuccessMessage = false
    let userID = UserDefaults.standard.string(forKey: "userId")!



    var body: some View {
        
        ScrollView(.vertical, showsIndicators: false){
            LazyVStack(spacing: 15, pinnedViews: [ .sectionHeaders]) {
                Section {
                    /*ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing:10){
                            ForEach(taskModel.questions, id: \.self){
                                question in
                                    Text(question.contenu)
                                        .font(.system(size: 10))

                                
                            }
                            .foregroundColor(.white)
                            .frame(width: 500,height: 100)
                            .background(
                                ZStack{
                                    Capsule()
                                        .fill(.black)
                                }
                            )
                            }
                            .contentShape(Capsule())
                            .onTapGesture {
                                withAnimation{
                                    
                                }
                            }
                        }*/
                   

                    
                        TasksView()
                        

                    
                } header: {
                    HeaderView()
                }
                
            }
        }
        .ignoresSafeArea(.container, edges: .top)
    }
    
   
    
    func TasksView() -> some View{
        VStack(spacing:10){
            LazyVStack(spacing: 25){
                
                if let questions = taskModel.questions{
                    
                    if questions.isEmpty{
                        
                        Text("No tasks found ??")
                            .font(.system(size: 16))
                            .fontWeight(.light)
                            .offset(y: 100)
                    }
                    else {
                        ForEach(questions){question in
                            Button(action: {
                                self.showActionSheet = true

                            }
                            ){
                                
                                TaskCardView(question: question)
                            }
                            .actionSheet(isPresented: $showActionSheet) {
                                ActionSheet(title: Text("Answer the question"), buttons: [
                                        .default(Text("Yes")) {
                                            score1 = score1+3
                                            },
                                        .default(Text("No")) {
                                            score1 = score1+10
                                            },
                                        .default(Text("Maybe")) {
                                            score1 = score1+6

                                            },
                                        .cancel()
                                                            
                                    ])
                            }
                            
                            
                        }
                    }
                    
                }else {
                    ProgressView()
                        .offset(y: 100)
                }
                
            }
            .padding()
            .padding(.top)
            
                Text("Done")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .bold()
                    .foregroundColor(.white)
                    .background(Color("colorgreen"))
                    .cornerRadius(10)
                    .onTapGesture {
                        print(score1)
                        
                      
                        let request1 = UpdateScoreResquest(userId: "\(userID)", score: score1)
                        taskModel.UpdateScore1(request: request1){ result in
                            switch result {
                            case .success(let response):
                                // Handle successful sign up
                                print(response)
                                self.showSuccessMessage = true
                                // Dismiss the sign in view after successful sign up
                                
                                // Redirect to login page
                                
                            case .failure(let error):
                                // Handle error
                                print(error.localizedDescription)
                            }
                        }
                    }
                    .padding(.top, 100)
                    .alert(isPresented: $showSuccessMessage) {
                                        Alert(title: Text("your score is"), message: Text("\(score1)"), dismissButton: .default(Text("OK")))
                                    }
            
            
        }
        
      
        
    }
    
    /*func TaskCardView(question: QuestionNew) -> some View {
            HStack(alignment: .top, spacing: 30) {
                VStack(alignment: .leading, spacing: 12) {
                    Text(question.contenu)
                        .font(.title2.bold())
                        .lineLimit(nil)
                        .fixedSize(horizontal: false, vertical: true)
                }
                .padding(15)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(Color("colorblue"))
                .foregroundColor(.white)
                .cornerRadius(25)
                .transition(.move(edge: .leading))
                .animation(.default)
            }
            .padding(.horizontal)
        }*/
    
    func TaskCardView(question: QuestionNew) -> some View {
        HStack(alignment: .top, spacing: 30) {
            VStack(alignment: .leading, spacing: 12) {
                Text(question.contenu)
                    .font(.title2.bold())
                    .lineLimit(nil) // Remove line limit to display complete text
                    .fixedSize(horizontal: false, vertical: true) // Allow text to wrap
            }
            .padding(15)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(Color("colorblue"))
            .foregroundColor(.white)
            .cornerRadius(25)
        }
        .padding(.horizontal)
    }

        
    func HeaderView()->some View{
        HStack (spacing: 10){
            
            VStack(alignment: .leading, spacing: 10) {
                
                Text(Date().formatted(date: .abbreviated, time: .omitted))
                    .foregroundColor(.gray)
                    .hCenter()
                
                Text("Let's start the Quiz")
                    .font(.largeTitle.bold())
                    .hCenter()
            }
            
            
         
            
        
    
        }
        .padding()
        .padding(.top,getSafeArea().top)
        .background(Color("tarf"))
    }
    
}
    

struct Test_Previews: PreviewProvider {
    let questionxxx : QuestionNew
      static var previews: some View {
          Test()
      }
  }

    extension View {
        func hLeading()->some View {
            self
                .frame(maxWidth: .infinity,alignment: .leading)
        }
        
        func hTrailing()->some View {
            self
                .frame(maxWidth: .infinity,alignment: .trailing)
        }
        
        func hCenter()->some View {
            self
                .frame(maxWidth: .infinity,alignment: .center)
        }
        
        func getSafeArea()->UIEdgeInsets{
            guard let screen = UIApplication.shared.connectedScenes.first as? UIWindowScene else{
                return .zero
            }
            
            guard let safeArea = screen.windows.first?.safeAreaInsets else{
                return .zero
            }
            
            return safeArea
        }
    }
