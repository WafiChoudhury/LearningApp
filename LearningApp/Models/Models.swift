//
//  Models.swift
//  LearningApp
//
//  Created by Wafi Choudhury on 8/6/21.
//

import Foundation


struct Module: Decodable, Identifiable{
    
    var id: Int
    var category: String
    var content: Content
    var test: Test
    
    
}

struct Content: Decodable, Identifiable{
    
    var id: Int
    var image: String
    var time: String
    var description: String
    var lessons: [Lessons]
    
}

struct Lessons: Decodable, Identifiable{
    
    var id: Int
    var title: String
    var video: String
    var duration: String
    var explanation: String
    

    
}
struct Test: Decodable, Identifiable{
    
    
    var id: Int
    var image: String
    var time: String
    var description: String
    var questions: [Question]
    
    
}

struct Question: Identifiable,Decodable{
    
    var id: Int
    var content: String
    var correctIndex: Int
    var answers: [String]
    
    
}
