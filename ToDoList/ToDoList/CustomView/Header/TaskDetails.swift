//
//  TaskDetails.swift
//  ToDoList
//
//  Created by Mahmoud Alaa on 05/11/2025.
//

import SwiftUI

struct TaskDetails: View {
    var taskName: String
    var title: String
    var subTitle: String
    var day: String
    var from: String
    var to: String
    
    var body: some View {
        HStack(spacing: 16) {
            Image(taskName)
                .resizable()
                .scaledToFit()
                .frame(width: 120 * .deviceFontScale,
                       height: 120 * .deviceFontScale)
                .background(Color.primaryApp)
                .clipShape(RoundedRectangle(cornerRadius: 14))
            
            VStack (alignment: .leading) {
                Text(title)
                    .font(.customfont(.semibold, fontSize: 18 * .deviceFontScale))
                Text(subTitle)
                    .font(.customfont(.regular, fontSize: 16 * .deviceFontScale))
                    .foregroundStyle(Color.LightGray)
                HStack {
                    Text(day)
                        .font(.customfont(.regular, fontSize: 12 * .deviceFontScale))
                        .foregroundStyle(Color.LightGray)
                    Spacer()
                    Text("\(from) to \(to)")
                        .font(.customfont(.regular, fontSize: 12 * .deviceFontScale))
                        .foregroundStyle(Color.LightGray)
                }
            }
        }
    }
}
