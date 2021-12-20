//
//  ContentDetailView.swift
//  LearningApp
//
//  Created by Wafi Choudhury on 8/11/21.
//

import SwiftUI
import AVKit

struct ContentDetailView: View {
    
    @EnvironmentObject var model: ContentModel
    
    
    
    
    var body: some View {
        
        
        
            let lesson = model.currentLesson
            
            let url = URL(string: Constants.videoHostUrl + (lesson?.video ?? " "))
            
        VStack{
        
            if url != nil{
                VideoPlayer(player: AVPlayer(url: url!))
            }
        
        CodeTextView()
        
        if model.hasNextLesson(){
             
            
            Button(action:
                    {model.nextLesson()}, label: {
                        
                        
                    let nextLessonTitle  = model.currentModule!.content.lessons[model.currentLessonIndex+1].title
                        
                    ZStack{
                        RectangleCard()
                        Text("Next Lesson \(nextLessonTitle)")
                            .foregroundColor(Color.white)
                            .bold()
                    }
                    })
        }
        else{
            //take user back to home view
            
            Button(action: {
                    model.currentContentSelected = nil
                
            },
                   label: {
                        
                    ZStack{
                        RectangleCard()
                        Text("Complete").foregroundColor(Color.white)
                            .bold()
                    }
            })
            }
        
        }.padding()
        .navigationBarTitle(lesson?.title ?? " " )

    }
}

struct ContentDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ContentDetailView()
    }
}
