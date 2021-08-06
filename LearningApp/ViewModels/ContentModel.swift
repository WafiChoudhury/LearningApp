//
//  ContentModel.swift
//  LearningApp
//
//  Created by Wafi Choudhury on 8/6/21.
//

import Foundation


class ContentModel: ObservableObject{
    
    
    @Published var modules = [Module]()
    
    var styleData: Data?
    
    
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
    
}

