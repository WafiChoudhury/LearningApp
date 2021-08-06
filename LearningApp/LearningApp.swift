//
//  LearningAppApp.swift
//  LearningApp
//
//  Created by Wafi Choudhury on 8/6/21.
//

import SwiftUI

@main
struct LearningApp: App {
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environmentObject(ContentModel())
            
            
            
        }
    }
}
