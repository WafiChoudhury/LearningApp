//
//  TestView.swift
//  LearningApp
//
//  Created by Wafi Choudhury on 12/19/21.
//

import SwiftUI

struct TestView: View {
    
    @EnvironmentObject var model:ContentModel
    @State var selectedAnswerIndex:Int?
    
    @ State var numCorrect = 0
    @State var submitted = false
    
    var body: some View {
        if model.currentQuestion != nil{
            
            VStack(alignment: .leading){
                
                //question number
                Text("Question \(model.currentQuestionIndex! + 1) of  \(model.currentModule?.test.questions.count ?? 0)" )
                    .padding(.leading, 20)
                
                CodeTextView()
                    .padding(.horizontal, 20)
                //question number
                
                //Answer
                
                ScrollView{
                    
                    VStack{
                        
                        ForEach(0..<model.currentQuestion!.answers.count, id: \.self ){ index in
                            
                            Button {
                            
                                //Track selected index
                                
                                selectedAnswerIndex = index
                                
                            } label: {
                                ZStack{
                                
                                    if(!submitted){
                                    
                                    RectangleCard(color: index == selectedAnswerIndex ? .gray : .blue)
                                    .frame(height: 48)
                                    Text(model.currentQuestion!.answers[index]).foregroundColor(.black)
                                    }
                                    
                                    else{
                                        
                                        if (index == selectedAnswerIndex && selectedAnswerIndex == model.currentQuestion!.correctIndex) || index == model.currentQuestion!.correctIndex {
                                            RectangleCard(color: .green)
                                            .frame(height: 48)
                                            
                                        }
                                        else if index == selectedAnswerIndex && selectedAnswerIndex != model.currentQuestion!.correctIndex{
                                            RectangleCard(color: .red)
                                            .frame(height: 48)
                                        }
                                        else{
                                            RectangleCard()
                                                .frame(height:48)
                                        }
                                        
                                        Text(model.currentQuestion!.answers[index]).foregroundColor(.black)

                                    }
                                    
                                }
                                

                                }.disabled(submitted)

                         
                        }
                    }
                    .padding()
                    .accentColor(.black)
                }
                
                
                
                //Button
                
                Button {
                    
                    //check answer
                    
                    if selectedAnswerIndex == model.currentQuestion!.correctIndex{
                        numCorrect += 1
                    }
                    submitted = true
                
                } label: {
                    ZStack{
                        
                        RectangleCard(color: .white)
                            .frame(height:48)
                            .accentColor(.black)
                        Text("Submit")
                            .foregroundColor(.black)

                    }
                    .padding()

                }.disabled(selectedAnswerIndex == nil)

            
            }
            .navigationBarTitle("\(model.currentModule?.category ?? "")")
        }
        else{
            
            ProgressView()
        }
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
