//
//  NotificationView.swift
//  ToDoList
//
//  Created by Mahmoud Alaa on 02/11/2025.
//

import SwiftUI
import Foundation

struct NotificationView<ViewModel: NotificationViewModelType>: View {
    
    // MARK: - Properties
    @StateObject var viewModel: ViewModel
    
    // MARK: - Body
    var body: some View {
        ZStack {
            VStack(alignment: .leading, spacing: 16) {
                navigationBar()
                headerSection()
                notificationList()
                Spacer()
            }
        }
        .navigationBarBackButtonHidden()
        .padding(.horizontal, 18)
    }
}
// MARK: - SubViews
//
extension NotificationView {
    func navigationBar() -> some View {
        BackAndEllipsesNavBar(
            onTappedBack: { viewModel.didTapBack() },
            onTappedEllipse: { viewModel.didTapMoreOptions() }
        )
    }
    
    func headerSection() -> some View {
        HeaderView(name: "Notifications", seeAll: "")
    }
    
    func notificationList() -> some View {
        ForEach(viewModel.notificationSections) { section in
            notificationSection(section)
        }
    }
    
    func notificationSection(_ section: NotificationSection) -> some View {
        VStack(alignment: .leading, spacing: 8) {
            sectionHeader(section.title)
            
            ForEach(section.notifications) { notification in
                notificationRow(notification)
            }
        }
    }
    
    func sectionHeader(_ title: String) -> some View {
        Text(title)
            .font(.customfont(.regular, fontSize: 14 * .deviceFontScale))
            .foregroundStyle(Color.darkGray)
            .padding(.bottom, 2 * .deviceFontScale)
    }
    
    func notificationRow(_ notification: NotificationItem) -> some View {
        NotificationRowView(
            imageName: notification.profileImageName,
            comment: notification.message
        )
        .onTapGesture {
            viewModel.didTapNotification(notification)
        }
        .swipeActions(edge: .trailing, allowsFullSwipe: true) {
            Button(role: .destructive) {
                viewModel.deleteNotification(notification)
            } label: {
                Label("Delete", systemImage: "trash")
            }
            
            Button {
                viewModel.markAsRead(notification)
            } label: {
                Label("Read", systemImage: "envelope.open")
            }
            .tint(.blue)
        }
    }
}
// MARK: - Preview
//
#Preview {
    
    let coordinator = AppCoordinator(taskStore: TaskStore())
    let dataProvider = NotificationDataProvider.shared
    
    NotificationView(
        viewModel: NotificationViewModel(
            sourceTab: .home,
            coordinator: coordinator,
            dataProvider: dataProvider
        )
    )
}
