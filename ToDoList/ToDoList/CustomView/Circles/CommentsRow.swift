//
//  CommentsRow.swift
//  ToDoList
//
//  Created by Mahmoud Alaa on 03/11/2025.
//

import SwiftUI

struct CommentsRow: View {
    var imageName: String
    var personName: String
    var comment: String
    var time: String
    
    var body: some View {
        HStack {
            Image(imageName)
                .resizable()
                .scaledToFit()
                .frame(width: 44 * .deviceFontScale, height: 44 * .deviceFontScale)
            
            VStack(alignment: .leading, spacing: 0) {
                Text(personName)
                    .font(.customfont(.medium, fontSize: 16 * .deviceFontScale))
                    
                Text(comment)
                    .font(.customfont(.regular, fontSize: 12 * .deviceFontScale))
                    .foregroundStyle(Color.LightGray)
            }
            
            Spacer()
            
            Text(time)
                .font(.customfont(.regular, fontSize: 12 * .deviceFontScale))
                .foregroundStyle(Color.LightGray)
        }
    }
}

#Preview {
    CommentsRow(imageName: "ProfilePicture2",
                personName: "Mahmoud Alaa",
                comment: "I think this is good",
                time: "5 min")
}
