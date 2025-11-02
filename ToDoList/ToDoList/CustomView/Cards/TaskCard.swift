//
//  CardTask.swift
//  ToDoList
//
//  Created by Mahmoud Alaa on 31/10/2025.
//

import SwiftUI

struct TaskCard: View {
    var imageName: String = "Mobile trading"
    var title: String = "Client Review &Feedback"
    var showStrikeLine: Bool = false
    var day: String = "Today"
    var start: String = "11:42 am"
    var end: String = "2:30 pm"
    @State var isChecked = false

    var body: some View {
        VStack {
            CircleAndText(name: imageName, title: title, showStrikeLine: showStrikeLine, isChecked: isChecked)
            Divider()
                .frame(height: 1)
                .background(Color.darkGray.opacity(1))
                .padding(.horizontal, 20 * .deviceFontScale)
            
            PersonsView(day: day, start: start, end: end)
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

#Preview {
    TaskCard()
}
