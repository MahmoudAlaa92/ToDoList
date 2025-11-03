//
//  NotificationRowView.swift
//  ToDoList
//
//  Created by Mahmoud Alaa on 02/11/2025.
//

import SwiftUI

struct NotificationRowView: View {
    var title: String?
    var imageName: String = "ProfilePicture"
    var comment: String = "Mohamed Samy assign to  you in a new project"
    
    var body: some View {
        VStack(alignment: .leading) {
            if title != nil {
                Text(title ?? "")
                    .font(.customfont(.regular, fontSize: 14))
                    .foregroundStyle(Color.darkGray)
            }
            HStack {
                Image(imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 42 * .deviceFontScale, height: 42 * .deviceFontScale)
                
                Text(comment)
                    .font(.customfont(.regular, fontSize: 14 * .deviceFontScale))
            }
        }
    }
}

#Preview {
    NotificationRowView()
}
