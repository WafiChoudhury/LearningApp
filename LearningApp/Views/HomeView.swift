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
        Text("Hello, world!")
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
