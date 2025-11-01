//
//  CalenderCard.swift
//  ToDoList
//
//  Created by Mahmoud Alaa on 01/11/2025.
//

import SwiftUI

struct CalenderCard: View {
    var title: String = "Mon"
    var number: Int = 6
    var progress: Double
    var lineWidth: CGFloat = 4
    var color: Color = .primaryApp
    var forGroundColor: Color = .primaryApp
    
    var body: some View {
        VStack {
            Text(title)
                .font(.customfont(.regular, fontSize: 14))
                .foregroundStyle(Color.LightGray)
            
            ZStack {
                
                if progress >= 1.0 {
                    Circle()
                        .fill(color)
                        .frame(width: 44 * .deviceFontScale,
                               height: 44 * .deviceFontScale)
                    
                    Text("\(number)")
                        .font(.customfont(.regular, fontSize: 16 * .deviceFontScale))
                        .foregroundColor(.white)
                        .offset(y: 2)
                    
                } else {
                    Circle()
                        .trim(from: 0, to: progress)
                        .rotation(Angle(degrees: 180))
                        .stroke(color,
                                style: StrokeStyle(lineWidth: lineWidth * .deviceFontScale,
                                                   lineCap: .round))
                        .frame(width: 44 * .deviceFontScale,
                               height: 44 * .deviceFontScale)
                    
                    Text("\(number)")
                        .font(.customfont(.regular, fontSize: 16 * .deviceFontScale))
                        .foregroundColor(forGroundColor)
                        .offset(y: 1)
                }
            }
        }
        
    }
    
}

#Preview {
    CalenderCard(progress: 0.9)
}
