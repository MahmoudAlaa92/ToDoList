//
//  DescriptionRow.swift
//  ToDoList
//
//  Created by Mahmoud Alaa on 05/11/2025.
//

import SwiftUI

struct DescriptionRow: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Description")
                .font(.customfont(.medium, fontSize: 18 * .deviceFontScale))
            
            Text("User research: Understanding user needs, preferences, and behaviors. Design principles: Applying established design guidelines and best practices. Design principles: Applying established design guidelines and best practices.")
                .font(.customfont(.regular, fontSize: 14 * .deviceFontScale))
                .foregroundStyle(Color.LightGray)
        }
        .padding(.vertical, 10)
    }
}

#Preview {
    DescriptionRow()
}
