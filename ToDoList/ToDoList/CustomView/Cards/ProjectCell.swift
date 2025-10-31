//
//  ProjectCell.swift
//  ToDoList
//
//  Created by Mahmoud Alaa on 31/10/2025.
//

import SwiftUI

struct ProjectCell: View {
    var name: String = "cubes"
    var title: String = "To Do List"
    var subtitle: String = "5 tasks"
    var colorSubTitle: Color = Color.darkGray
    var colorCircle: Color = Color.lightPink
    var backgroundColor: Color = Color.lightBeige
    
    var body: some View {
        VStack {
            HStack {
                CircleAndText(
                    name: name,
                    title: title,
                    subTitle: subtitle,
                    colorSubTitle: colorSubTitle,
                    colorCircle: colorCircle,
                    showCheckCircle: false
                )
                Spacer()
            }
        }
        .padding()
        .frame(width: .screenWidth * 0.9, height: 80 * .deviceFontScale)
        .background(backgroundColor)
        .clipShape(RoundedRectangle(cornerRadius: 20))
    }
}

#Preview {
    ProjectCell()
}
