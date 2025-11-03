//
//  CustomTextField.swift
//  ToDoList
//
//  Created by Mahmoud Alaa on 30/10/2025.
//

import SwiftUI

struct CustomTextField: View {
    var title: String?
    var placeholder: String
    @Binding var text: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            if title != nil {
                Text(title ?? "")
                    .font(.customfont(.medium, fontSize: 16 * .deviceFontScale))
                
            }
            TextField(placeholder, text: $text)
                .frame(height: 32)
                .padding(.horizontal, 12)
                .padding(.vertical, 8)
                .background(Color.white)
                .clipShape(RoundedRectangle(cornerRadius: 16))
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.gray.opacity(1), lineWidth: 1)
                )
        }
    }
}
