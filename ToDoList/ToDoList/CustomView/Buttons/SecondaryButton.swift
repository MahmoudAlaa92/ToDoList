//
//  SecondryButton.swift
//  ToDoList
//
//  Created by Mahmoud Alaa on 05/11/2025.
//

import SwiftUI

struct SecondaryButton: View {
    var title: String
    var width: Double = .screenWidth * 0.9    
    var action: () -> Void
    
    var body: some View {
        Text(title)
            .font(.customfont(.medium, fontSize: 17 * .deviceFontScale))
            .frame(width: width, height: 52 * .deviceFontScale)
            .foregroundStyle(Color.primaryApp)
            .background(
                RoundedRectangle(cornerRadius: 8).stroke(Color.primaryApp, lineWidth: 1)
            )
            .padding(.bottom, 12)
            .onTapGesture {
                action()
            }
    }
}

#Preview {
    SecondaryButton(title: "back", action: {})
}
