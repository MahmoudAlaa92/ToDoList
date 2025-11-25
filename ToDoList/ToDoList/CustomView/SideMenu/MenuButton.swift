//
//  MenuButton.swift
//  ToDoList
//
//  Created by Mahmoud Alaa on 25/11/2025.
//

import SwiftUI

// MARK: - Menu Button Component
struct MenuButton: View {
    let image: String
    let title: String
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack(spacing: 12) {
                Image(image)
                    .font(.title3)
                    .foregroundColor(.primary)
                    .frame(width: 30)
                
                Text(title)
                    .font(.body)
                    .foregroundColor(.primary)
                
                Spacer()
            }
            .padding(.vertical, 12)
            .padding(.horizontal, 8)
            .cornerRadius(8)
        }
    }
}
