//
//  BackAndTitleNavBar.swift
//  ToDoList
//
//  Created by Mahmoud Alaa on 03/11/2025.
//

import SwiftUI

struct BackAndTitleNavBar: View {
    var title: String
    
    var body: some View {
        HStack {
            Image("Back")
                .resizable()
                .scaledToFit()
                .frame(width: 30, height: 30)
            
            Text(title)
                .font(.customfont(.medium, fontSize: 18 * .deviceFontScale))
            
            Spacer()
        }
        .padding(.bottom, 24)

    }
}

#Preview {
    BackAndTitleNavBar(title: "Comments")
}
