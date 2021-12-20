//
//  TestView.swift
//  LearningApp
//
//  Created by Wafi Choudhury on 12/19/21.
//

import SwiftUI

struct TestView: View {
    
    @EnvironmentObject var model:ContentModel
    var body: some View {
        if model.currentQuestion != nil{
            
            VStack{
                
                //question number
                Text("Question \(model.currentQuestionIndex! + 1) of  \(model.currentModule?.test.questions.count ?? 0)" )
                
                CodeTextView()
                //question number
                
                //Answer
                
                //Button
                
            
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
