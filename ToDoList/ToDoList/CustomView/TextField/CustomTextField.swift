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
    var height: Double = 32 * .deviceFontScale
    @Binding var text: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            if title != nil {
                Text(title ?? "")
                    .font(.customfont(.medium, fontSize: 16 * .deviceFontScale))
                
            }
            
            if height == 32 * .deviceFontScale {
                TextField(placeholder, text: $text)
                    .frame(height: height)
                    .padding(.horizontal, 12)
                    .padding(.vertical, 8)
                    .background(Color.white)
                    .clipShape(RoundedRectangle(cornerRadius: 16))
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.gray.opacity(1), lineWidth: 1)
                    )
            } else {
                ZStack(alignment: .topLeading) {
                    /// Background with border
                    RoundedRectangle(cornerRadius: 16)
                        .fill(Color.white)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.gray.opacity(1), lineWidth: 1)
                        )
                        .frame(height: height)
                    
                    /// Placeholder text
                    if text.isEmpty {
                        Text(placeholder)
                            .foregroundColor(.gray)
                            .padding(.horizontal, 16)
                            .padding(.top, 12)
                            .allowsHitTesting(false) ///  prevents blocking TextEditor
                    }
                    
                    /// TextEditor
                    TextEditor(text: $text)
                        .padding(.horizontal, 12)
                        .padding(.top, 8)
                        .frame(height: height)
                        .background(Color.clear)
                        .scrollContentBackground(.hidden) /// iOS 16+ to make background truly transparent
                }
             
            }
        }
    }
}
