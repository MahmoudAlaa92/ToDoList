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
            Text(L10n.ProjectDetails.description)
                .font(.customfont(.medium, fontSize: 18 * .deviceFontScale))
            
            Text(L10n.ProjectDetails.example)
                .font(.customfont(.regular, fontSize: 14 * .deviceFontScale))
                .foregroundStyle(Color.LightGray)
        }
        .padding(.vertical, 10)
    }
}

#Preview {
    DescriptionRow()
}
