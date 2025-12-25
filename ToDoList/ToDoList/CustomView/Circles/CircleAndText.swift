//
//  CircleAndText.swift
//  ToDoList
//
//  Created by Mahmoud Alaa on 31/10/2025.
//

import SwiftUI

struct CircleAndText: View {
    var circleItem: PlannedModel
    var showCheckCircle: Bool = true
    @State var isChecked = false

    var body: some View {
        HStack {
            Circle()
                .frame(
                    width: 60 * .deviceFontScale,
                    height: 60 * .deviceFontScale
                )
                .foregroundStyle(circleItem.colorCircle ?? .primary)
                .overlay(
                    Circle().stroke(Color.primary.opacity(0.2), lineWidth: 0.5)
                )
                .overlay {
                    Image(circleItem.imageName)
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
                        .strikethrough(isChecked, color: .gray)

                    Text(circleItem.subTitle)
                        .foregroundStyle(circleItem.colorSubTitle ?? .primary)
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
                        CheckCircleButton(isChecked: $isChecked)
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

        circleItem: PlannedModel(
            title: "Review your notes",
            subTitle: "Redesign",
            day: "Friday",
            start: "10:00pm",
            end: "11:00pm",
            imageName: "cubes",
            colorSubTitle: .LightGray,
            colorCircle: .white,
            backgroundColor: .lightPink
        )
    )
}
