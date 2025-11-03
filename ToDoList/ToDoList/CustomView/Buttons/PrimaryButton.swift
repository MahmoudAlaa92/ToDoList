//
//  PrimaryButton.swift
//  ToDoList
//
//  Created by Mahmoud Alaa on 30/10/2025.
//

import SwiftUI

struct PrimaryButton: View {
    var title: String
    var action: () -> Void
    
    var body: some View {
        Text(title)
            .font(.customfont(.medium, fontSize: 17))
            .frame(width: .screenWidth * 0.9, height: 52 * .deviceFontScale)
            .foregroundStyle(.white)
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .fill(Color.primaryApp)
            )
            .padding(.bottom, 12)
            .onTapGesture {
                action()
            }
    }
}
