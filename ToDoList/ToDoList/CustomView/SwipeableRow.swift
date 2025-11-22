//
//  SwipeableRow.swift
//  ToDoList
//
//  Created by Mahmoud Alaa on 22/11/2025.
//

import SwiftUI

struct SwipeableRow<Content: View>: View {
    let content: () -> Content
    let onDelete: () -> Void

    @State private var offsetX: CGFloat = 0

    var body: some View {
        ZStack(alignment: .trailing) {
            // Delete Button Background
            Button {
                withAnimation { onDelete() }
            } label: {
                Image(systemName: "trash")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.primaryApp)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
            }
            .padding(.trailing, 12)

            // Main Content
            content()
                .background(Color(.systemBackground))
                .offset(x: offsetX)
                .gesture(
                    DragGesture()
                        .onChanged { value in
                            if value.translation.width < 0 { // swipe left
                                offsetX = value.translation.width
                            }
                        }
                        .onEnded { value in
                            if value.translation.width < -80 {
                                // open swipe fully
                                withAnimation { offsetX = -80 }
                            } else {
                                withAnimation { offsetX = 0 }
                            }
                        }
                )
        }
        .animation(.spring(), value: offsetX)
    }
}
