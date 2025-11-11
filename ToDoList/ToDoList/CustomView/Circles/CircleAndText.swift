//
//  CircleAndText.swift
//  ToDoList
//
//  Created by Mahmoud Alaa on 31/10/2025.
//

import SwiftUI

struct CircleAndText: View {
    var circleItem: ProjectModel
    var showCheckCircle: Bool = true
    var showStrikeLine: Bool = false
    @State var isChecked = false

    var body: some View {
        HStack {
            Circle()
                .frame(
                    width: 60 * .deviceFontScale,
                    height: 60 * .deviceFontScale
                )
                .foregroundStyle(circleItem.colorCircle)
                .overlay(
                    Circle().stroke(Color.primary.opacity(0.2), lineWidth: 0.5)
                )
                .overlay {
                    Image(circleItem.name)
                        .resizable()
                        .scaledToFit()
                        .frame(
                            width: 54 * .deviceFontScale,
                            height: 54 * .deviceFontScale
                        )
                }
            HStack {
                VStack(alignment: .leading) {
                    Spacer().frame(width: 10, height: 10)
                    Text(circleItem.title)
                        .font(
                            .customfont(
                                .medium,
                                fontSize: 16 * .deviceFontScale
                            )
                        )
                        .strikethrough(showStrikeLine, color: .gray)

                    Text(circleItem.subtitle)
                        .foregroundStyle(circleItem.colorSubTitle)
                        .font(
                            .customfont(
                                .regular,
                                fontSize: 11 * .deviceFontScale
                            )
                        )
                }
                if showCheckCircle {
                    Spacer()
                    VStack {
                        CheckCircleButton(isChecked: isChecked)
                        Spacer().frame(width: 10, height: 20)
                    }
                }

            }
        }
    }
}
// MARK: - Preview
//
#Preview {
    CircleAndText(
    
        circleItem: ProjectModel(
            name: "cubes",
            title: "Review your notes",
            subtitle: "Resdesing",
            colorSubTitle: .LightGray,
            colorCircle: .white,
            backgroundColor: .lightPink
        )
    )
}
