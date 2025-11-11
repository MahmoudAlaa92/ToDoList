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
    weak var coordinator: AppCoordinator?

    var body: some View {
        ZStack {
            VStack(alignment: .leading, spacing: 16) {
                BackAndEllipsesNavBar(
                    onTappedBack: { coordinator?.goBack(from: .home)},
                    onTappedEllipse: {})

                HeaderView(name: "Notifications", seeAll: "")
                notificationRows(days: Array(viewModel.notificationItem.keys))
                
                Spacer()
            }
        }
        .navigationBarBackButtonHidden()
        .padding(.horizontal, 18)
    }
}
// MARK: - Views
//
extension NotificationView {
    
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
