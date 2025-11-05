//
//  AlertRow.swift
//  ToDoList
//
//  Created by Mahmoud Alaa on 05/11/2025.
//

import SwiftUI

struct AlertRow: View {
    var imageName: String
    var title: String
    var subTitle: String
    
    var body: some View {
        HStack {
            Image(imageName)
                .resizable()
                .scaledToFit()
                .frame(width: 30,
                       height: 30)
            VStack(alignment: .leading) {
                Text(title)
                    .font(.customfont(.medium, fontSize: 14))
                    .foregroundStyle(.black)
                
                Text(subTitle)
                    .font(.customfont(.regular, fontSize: 12))
                    .foregroundStyle(Color.LightGray)
            }
            Spacer()
        }
        .frame(width: .screenWidth - 60,
               height: 44 * .deviceFontScale)
        .padding(8)
        .background(RoundedRectangle(cornerRadius: 12).stroke(Color.gray.opacity(0.5),lineWidth: 1)
        )
    }
}

