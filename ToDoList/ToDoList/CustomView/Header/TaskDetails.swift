//
//  TaskDetails.swift
//  ToDoList
//
//  Created by Mahmoud Alaa on 05/11/2025.
//

import SwiftUI

struct TaskDetails: View {
    var taskItems: PlannedModel
    
    var body: some View {
        HStack(spacing: 16) {
            Image(taskItems.imageName)
                .resizable()
                .scaledToFit()
                .frame(width: 120 * .deviceFontScale,
                       height: 120 * .deviceFontScale)
                .background(Color.primaryApp)
                .clipShape(RoundedRectangle(cornerRadius: 14))
            
            VStack (alignment: .leading) {
                Text(taskItems.title)
                    .font(.customfont(.semibold, fontSize: 18 * .deviceFontScale))
                Text(taskItems.subTitle)
                    .font(.customfont(.regular, fontSize: 16 * .deviceFontScale))
                    .foregroundStyle(Color.LightGray)
                HStack {
                    Text(taskItems.day)
                        .font(.customfont(.regular, fontSize: 12 * .deviceFontScale))
                        .foregroundStyle(Color.LightGray)
                    Spacer()
                    Text("\(taskItems.start) to \(taskItems.end)")
                        .font(.customfont(.regular, fontSize: 12 * .deviceFontScale))
                        .foregroundStyle(Color.LightGray)
                }
            }
        }
    }
}
