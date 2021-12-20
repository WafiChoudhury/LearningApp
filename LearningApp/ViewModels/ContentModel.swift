//
//  ContentModel.swift
//  LearningApp
//
//  Created by Wafi Choudhury on 8/6/21.
//

import Foundation


class ContentModel: ObservableObject{
    
    
    @Published var modules = [Module]()
    
    //keep state of things
    
    
    //current lesson explanatio
    
    @Published var lessonText = NSAttributedString()
    
    
    @Published var currentModule: Module?
    
    @Published var currentModuleIndex = 0
    @Published var currentLesson: Lessons?
    var currentLessonIndex = 0
    
    var styleData: Data?
    @Published var currentTestSelected:Int?
    @Published var currentQuestion: Question?
    @Published var currentQuestionIndex:Int?
    //Current selected content
    @Published var currentContentSelected:Int?
    
    init(){
        
        getLocalData()
        
        
    }
    func getLocalData() {
        
        // get url to json
        let jsonUrl = Bundle.main.url(forResource: "data", withExtension: "json")
        
        
        //read file into a data obj
        
        do{
        
              let jsonData = try Data(contentsOf: jsonUrl!)
            
            
              let jsonDecoder  = JSONDecoder()

              let modules =  try jsonDecoder.decode([Module].self, from: jsonData)
                
              self.modules = modules
                
                
     
        }
        catch{
            
            print(error)
            
        }
        
        //MARK: parse style data
        
        let styleURL = Bundle.main.url(forResource: "style", withExtension: "html")
        
        
        do{
            
           let styleData = try Data(contentsOf: styleURL!)
            
            self.styleData = styleData
        }
        
        catch{
            
            
            print("coudnt parse style data")
        }
        
        
        
    }
    
    
    
    //MARK: Data Methods
    
    //MARK: Module Nav Methods
    func beginModule(_ moduleid:Int){
    
        //find the index for module id
        
        for index in 0...modules.count{
            
            if(modules[index].id == moduleid){
                
                currentModuleIndex = index
                break
            }
            
        }
        
        currentModule = modules[currentModuleIndex]
    }
    
    
    func beginLesson(_ lessonIndex:Int){
        
        //check that lesson index is within range of module lesson
        
        if(lessonIndex < currentModule!.content.lessons.count){
            
            currentLessonIndex = lessonIndex
        }
        else{
            
            currentLessonIndex = 0
        }
        
        currentLesson = currentModule!.content.lessons[currentLessonIndex]
        //set current lesson
        lessonText = addStyling(currentLesson!.explanation)
    }
    
    
    
    //advance to the next lesson
    func nextLesson(){
        currentLessonIndex+=1
        
        if currentLessonIndex < currentModule!.content.lessons.count{
            
            currentLesson = currentModule!.content.lessons[currentLessonIndex]
            lessonText = addStyling(currentLesson!.explanation)
        }
        
        else{
            
            currentLesson = nil
            currentLessonIndex = 0
            
            
        }
    }
    
    
    func hasNextLesson() -> Bool{
        
       
        return currentLessonIndex+1 < currentModule!.content.lessons.count
        
    }
    
    func beginTest(_ moduleId:Int){
        
        //set module
        
        beginModule(moduleId)
        
        currentQuestionIndex = 0
        
        if(currentModule?.test.questions.count ?? 0 > 0){
            
            currentQuestion = currentModule!.test.questions[currentQuestionIndex!]
            
            lessonText = addStyling(currentQuestion!.content)
        }
        
    }
    
    
    private func addStyling(_ htmlString: String) -> NSAttributedString{
        var resultString  = NSAttributedString()
        
        var data = Data()
        
        if(styleData != nil){
            data.append(self.styleData!)

        }
        
        data.append(Data(htmlString.utf8))
        
        if let attributedString = try? NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html], documentAttributes: nil) {
           resultString = attributedString
        }
        
        
        return resultString
    }
    
}

