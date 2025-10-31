//
//  SemiCircleProgressView.swift
//  ToDoList
//
//  Created by Mahmoud Alaa on 31/10/2025.
//

import SwiftUI

struct SemiCircleProgressView: View {
    var progress: Double // from 0.0 to 1.0
    var lineWidth: CGFloat = 8
    var color: Color = .blue
    
    var body: some View {
        ZStack {
            
            // Progress arc
            Circle()
                .trim(from: 0, to: progress)
                .rotation(Angle(degrees: 180))
                .stroke(color, style: StrokeStyle(lineWidth: lineWidth * .deviceFontScale, lineCap: .round))
                .frame(width: 50 * .deviceFontScale,
                       height: 50 * .deviceFontScale)
            
            // Percentage Text
            Text("\(Int(progress * 100))%")
                .font(.customfont(.semibold, fontSize: 14 * .deviceFontScale))
                .foregroundColor(.white)
                .offset(y: 2) // move down to stay inside the semicircle
        }
    }
}


#Preview {
    SemiCircleProgressView(progress: 0.5)
}
