//
//  TaskActionBar.swift
//  ToDoList
//
//  Created by Mahmoud Alaa on 04/11/2025.
//

import SwiftUI

struct TaskActionBar: View {
    var onCalendarTap: () -> Void
    var onAlertTap: () -> Void
    var onFlagTap: () -> Void
    var onPhotoTap: () -> Void
    var onMicTap: () -> Void
    var onPlusTap: () -> Void

    var body: some View {
        HStack(spacing: 12) {
            iconButton("calender", action: onCalendarTap)
            iconButton("alert2", action: onAlertTap)
            iconButton("flag", action: onFlagTap)
            iconButton("alertPhoto", action: onPhotoTap)
            iconButton("micPhoto", action: onMicTap)
            iconButton("plus", action: onPlusTap)
        }
    }

    // MARK: - Helper View
    private func iconButton(_ name: String, action: @escaping () -> Void) -> some View {
        Button(action: action) {
            Image(name)
                .resizable()
                .scaledToFit()
                .frame(width: 30 * .deviceFontScale,
                       height: 30 * .deviceFontScale)
        }
        .buttonStyle(.plain)
    }
}

#Preview {
    TaskActionBar(
        onCalendarTap: { print("Calendar tapped") },
        onAlertTap: { print("Alert tapped") },
        onFlagTap: { print("Flag tapped") },
        onPhotoTap: { print("Photo tapped") },
        onMicTap: { print("Mic tapped") },
        onPlusTap: { print("Plus tapped") }
    )
}
