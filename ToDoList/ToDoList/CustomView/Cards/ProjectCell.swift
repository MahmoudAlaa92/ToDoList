//
//  ProjectCell.swift
//  ToDoList
//
//  Created by Mahmoud Alaa on 31/10/2025.
//

import SwiftUI

struct ProjectCell: View {
    var projectItem: PlannedModel

    var body: some View {
        VStack {
            HStack {
                CircleAndText(
                    circleItem: projectItem,
                    showCheckCircle: false
                )

                Spacer()
            }
        }
        .padding()
        .frame(width: .screenWidth * 0.9, height: 80 * .deviceFontScale)
        .background(projectItem.backgroundColor)
        .clipShape(RoundedRectangle(cornerRadius: 20))
    }
}
// MARK: - Preview
//
#Preview {
}
