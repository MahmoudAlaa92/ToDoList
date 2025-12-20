//
//  NotificationViewModel.swift
//  ToDoList
//
//  Created by Mahmoud Alaa on 03/11/2025.
//

import Combine
import Foundation

final class NotificationViewModel: NotificationViewModelType {
    
    // MARK: - Dependencies
    private let dataProvider: NotificationDataProviderProtocol
    weak var coordinator: CoordinatorProtocol?
    
    // MARK: - Output Properties
    @Published var notificationSections: [NotificationSection]
    let sourceTab: Tabs
    
    // MARK: - Init
    init(
        sourceTab: Tabs,
        coordinator: CoordinatorProtocol?,
        dataProvider: NotificationDataProviderProtocol
    ) {
        self.sourceTab = sourceTab
        self.coordinator = coordinator
        self.dataProvider = dataProvider
        
        // Fetch data from data provider
        self.notificationSections = dataProvider.fetchNotifications()
    }
}
// MARK: - Input Methods
//
extension NotificationViewModel {
    func didTapBack() {
        coordinator?.goBack(from: sourceTab)
    }
    
    func didTapMoreOptions() {
        // Implement more options action
        print("More options tapped")
    }
    
    func didTapNotification(_ notification: NotificationItem) {
        print("Notification tapped: \(notification.message)")
    }
    
    func markAsRead(_ notification: NotificationItem) {
        print("Mark as read: \(notification.id)")
    }
    
    func deleteNotification(_ notification: NotificationItem) {
        // Remove notification from the list
        notificationSections = notificationSections.map { section in
            let updatedNotifications = section.notifications.filter { $0.id != notification.id }
            return NotificationSection(
                id: section.id,
                title: section.title,
                notifications: updatedNotifications
            )
        }.filter { !$0.notifications.isEmpty } // Remove empty sections
        
        print("Notification deleted: \(notification.id)")
    }
}

// MARK: - Private Methods
private extension NotificationViewModel {
    func refreshNotifications() {
        notificationSections = dataProvider.fetchNotifications()
    }
    
    func clearAllNotifications() {
        notificationSections = []
    }
    
    func filterNotifications(by searchText: String) -> [NotificationSection] {
        guard !searchText.isEmpty else { return notificationSections }
        
        return notificationSections.compactMap { section in
            let filteredNotifications = section.notifications.filter {
                $0.message.localizedCaseInsensitiveContains(searchText)
            }
            
            guard !filteredNotifications.isEmpty else { return nil }
            
            return NotificationSection(
                id: section.id,
                title: section.title,
                notifications: filteredNotifications
            )
        }
    }
}
