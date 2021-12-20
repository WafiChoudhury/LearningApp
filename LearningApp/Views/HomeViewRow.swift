//
//  HomeViewRow.swift
//  LearningApp
//
//  Created by Wafi Choudhury on 8/6/21.
//

import SwiftUI

struct HomeViewRow: View {
    var image: String
    var description:String
    var title: String
    var count: String
    var time: String
    
    var body: some View {
        
        
        
        ZStack{
            Rectangle()
                .foregroundColor(.white)
                .cornerRadius(10)
                .shadow(radius: 5)
                .aspectRatio(CGSize(width: 335, height: 175), contentMode: .fit)
            
               
            
            HStack{
                
                //image
                Image(image)
                    .resizable()
                    .frame(width: 116, height: 116)
                    .clipShape(Circle())
                
                
                Spacer()
                //text
                
                VStack(alignment: .leading, spacing:20){
                    
                    Text(title)
                        .bold()
                    Text(description)
                        .padding(.bottom,20)

                    
                    HStack{
                        
                        
                        //number of lessons
                        
                        Image(systemName: "text.book.closed")
                            .resizable()
                            .frame(width:15, height:15)
                        
                        Text(count)
                            .font(.caption)
                        
                        Image(systemName: "clock")
                            .resizable()
                            .frame(width:15, height:15)

                        Text(time)
                            .font(.caption)
                        
                        
                    }
                    
                    
                }.padding(.leading, 20)
                
                
            }.padding(.horizontal,20)
            
            
        }
    }
}

struct HomeViewRow_Previews: PreviewProvider {
    static var previews: some View {
        HomeViewRow(
            image: "swift", description: "Description", title: "Learn Swift", count: "20", time: "3 hours"
        
        )
    }
}
