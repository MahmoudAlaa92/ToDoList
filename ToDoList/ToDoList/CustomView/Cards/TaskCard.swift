//
//  CardTask.swift
//  ToDoList
//
//  Created by Mahmoud Alaa on 31/10/2025.
//

import SwiftUI

struct TaskCard: View {
    var taskCardModel: PlannedModel
    var showStrikeLine: Bool = false
    @State var isChecked = false
    var onDelete: (() -> Void)?

    var body: some View {
        VStack {
            CircleAndText(
                circleItem: taskCardModel,
                showStrikeLine: showStrikeLine,
                isChecked: isChecked
            )
            Divider()
                .frame(height: 1)
                .background(Color.darkGray.opacity(1))
                .padding(.horizontal, 20 * .deviceFontScale)

            PersonsView(
                day: taskCardModel.day,
                start: taskCardModel.start,
                end: taskCardModel.end
            )
        }
        .listRowInsets(EdgeInsets())
        .listRowSeparator(.hidden)
        .listRowBackground(Color.clear)
        .swipeActions(edge: .trailing) {
            Button(role: .destructive) {
                onDelete?()
            } label: {
                Label("Delete", systemImage: "trash")
            }
        }
        .padding(.horizontal, 12 * .deviceFontScale)
        .padding(.vertical, 12 * .deviceFontScale)
        .background(
            RoundedRectangle(cornerRadius: 26)
                .stroke(Color.gray.opacity(0.5), lineWidth: 1)
        )
        .padding(.bottom, 10 * .deviceFontScale)
    }
}
// MARK: - Preview
//
#Preview {
    TaskCard(
        taskCardModel: .init(
            title: "",
            subTitle: "",
        day: "",
            start: "",
            end: "",
            imageName: "",
            colorSubTitle: .red,
            colorCircle: .red,
            backgroundColor: .red
        ), onDelete: nil
    )

}
