//
//  RectangleCard.swift
//  LearningApp
//
//  Created by Wafi Choudhury on 12/18/21.
//

import SwiftUI

struct RectangleCard: View {
    var body: some View {
        Rectangle()
            .frame(height:48)
            .foregroundColor(.blue)
            .cornerRadius(10)
            .shadow(radius: 5)
    }
}

struct RectangleCard_Previews: PreviewProvider {
    static var previews: some View {
        RectangleCard()
    }
}
