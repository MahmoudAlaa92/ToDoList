//
//  PriorityCircle.swift
//  ToDoList
//
//  Created by Mahmoud Alaa on 02/11/2025.
//

import SwiftUI

struct PriorityCircle: View {
    var title: String
    var number: Int
    var isSelected: Bool
    var action: () -> Void
    
    var body: some View {
        
        HStack {
            Text(title)
                .foregroundStyle(isSelected ? Color.primaryApp : Color.darkGray)
                .font(.customfont(.semibold, fontSize: 16))
            
            ZStack {
                Circle()
                    .fill(isSelected ? Color.primaryApp : Color.gray)
                    .frame(width: 32 * .deviceFontScale,
                           height: 32 * .deviceFontScale)
                
                Text("\(number)")
                    .foregroundColor(.white)
                    .font(.customfont(.semibold, fontSize: 16 * .deviceFontScale))
            }
        }
        .onTapGesture {
            action()
        }
    }
}
