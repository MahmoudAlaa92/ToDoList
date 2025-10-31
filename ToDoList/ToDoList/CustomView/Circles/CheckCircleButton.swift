//
//  CheckCircleButton.swift
//  ToDoList
//
//  Created by Mahmoud Alaa on 31/10/2025.
//

import SwiftUI

struct CheckCircleButton: View {
    @State private var isChecked = false

    var body: some View {
        Button {
            withAnimation(.spring()) {
                isChecked.toggle()
            }
        } label: {
            ZStack {
                Circle()
                    .stroke(isChecked ? Color.primaryApp : Color.gray, lineWidth: 2)
                    .frame(width: 30 * .deviceFontScale, height: 30 * .deviceFontScale)
                    .background(
                        Circle()
                            .fill(isChecked ? .primaryApp.opacity(0.2) : Color.clear)
                    )

                if isChecked {
                    Image(systemName: "checkmark")
                        .foregroundColor(.primaryApp)
                        .font(.system(size: 18 * .deviceFontScale, weight: .bold))
                        .transition(.scale.combined(with: .opacity))
                }
            }
        }
        .buttonStyle(.plain)
    }
}

#Preview {
    CheckCircleButton()
}
