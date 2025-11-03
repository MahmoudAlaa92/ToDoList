//
//  Notification.swift
//  ToDoList
//
//  Created by Mahmoud Alaa on 02/11/2025.
//

import SwiftUI
import Foundation

struct NotificationView: View {
    
    @StateObject var viewModel: NotificationViewModel
    
    var body: some View {
        ZStack {
            VStack(alignment: .leading, spacing: 16) {
                navBar()
                HeaderView(name: "Notifications", seeAll: "")
                notificationRows(days: Array(viewModel.notificationItem.keys))
                
                Spacer()
            }
        }
        .padding(.horizontal, 18)
    }
}

#Preview {
    NotificationView(viewModel: NotificationViewModel())
}

// MARK: - Views
//
extension NotificationView {
    func navBar() -> some View {
        HStack {
            Image("Back")
                .resizable()
                .scaledToFit()
                .frame(width: 30, height: 30)
            Spacer()
            Image("Ellipsis")
                .resizable()
                .scaledToFit()
                .frame(width: 30, height: 30)
        }
        .padding(.bottom, 16)
    }
    
    func notificationRows(days: [String]) -> some View {
        ForEach(days, id: \.self) { day in
            if let itemsForDay = viewModel.notificationItem[day] {
                VStack(alignment: .leading) {
                    Text(day)
                        .font(.customfont(.regular, fontSize: 14 * .deviceFontScale))
                        .foregroundStyle(Color.darkGray)
                        .padding(.bottom, 2 * .deviceFontScale)
                    
                    ForEach(Array(itemsForDay.keys), id: \.self) { profileKey in
                        if let message = itemsForDay[profileKey] {
                            NotificationRowView(imageName: profileKey, comment: message)
                        }
                    }
                }
            }
        }
    }
    
}
