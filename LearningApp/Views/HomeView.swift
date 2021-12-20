//
//  ContentView.swift
//  LearningApp
//
//  Created by Wafi Choudhury on 8/6/21.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var model:ContentModel
    
    
    var body: some View {
        
        NavigationView{
            
            
            VStack(alignment:.leading){
                
                Text("What Do You Want To Learn?")
                    .padding(.leading,20)
                
                
                
                ScrollView{
                    
                    
                    LazyVStack{
                        
                        ForEach(model.modules){ module in
                            
                            VStack(spacing:20){
                                
                                NavigationLink(
                                    destination: ContentView()
                                        .onAppear(perform: {
                                            model.beginModule(module.id)
                                        }),
                                    tag: module.id,
                                    selection: $model.currentContentSelected){
                                        HomeViewRow(image:  module.content.image, description: module.content.description, title: "Learn \(module.category)", count: "\(module.content.lessons.count) Lessons", time: module.content.time)
                                        
                                    }
                                
                            //learning card
                                
                            
                        NavigationLink(
                            destination: TestView()
                                .onAppear(perform:
                                            {
                                                model.beginTest(module.id)
                                            }
                                ),
                            tag: module.id,
                            selection: $model.currentTestSelected)
                            {
                                HomeViewRow(image: module.test.image, description: module.test.description, title: "Learn \(module.category)", count: "\(module.test.questions.count) Lessons", time: module.test.time)
                        
                                
                                
                            }
                                NavigationLink(destination: EmptyView()) {
                                    EmptyView()
                                }
                        }
                        
                    }.padding()
                    .accentColor(.black)
                }
                
                
            }.navigationTitle("Get Started")
        }
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(ContentModel())
    }
}
}
