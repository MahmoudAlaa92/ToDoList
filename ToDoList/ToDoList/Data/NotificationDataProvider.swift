//
//  NotificationDataProvider.swift
//  ToDoList
//
//  Created by Mahmoud Alaa on 19/12/2025.
//

import Foundation

// MARK: - Protocol
protocol NotificationDataProviderProtocol {
    func fetchNotifications() -> [NotificationSection]
}

// MARK: - Implementation
final class NotificationDataProvider: NotificationDataProviderProtocol {
    
    // MARK: - Singleton
    static let shared = NotificationDataProvider()
    
    // MARK: - Initialization
    private init() {}
    
    // MARK: - Public Methods
    func fetchNotifications() -> [NotificationSection] {
        return [
            NotificationSection(
                title: L10n.Notifications.today,
                notifications: [
                    NotificationItem(
                        profileImageName: "ProfilePicture",
                        message: L10n.Notifications.assignedMessage(L10n.Notifications.mohamedSamy)
                    )
                ]
            ),
            NotificationSection(
                title: L10n.Notifications.yesterday,
                notifications: [
                    NotificationItem(
                        profileImageName: "ProfilePicture",
                        message: L10n.Notifications.assignedMessage(L10n.Notifications.mohamedSamy)
                    ),
                    NotificationItem(
                        profileImageName: "ProfilePicture2",
                        message: L10n.Notifications.assignedMessage(L10n.Notifications.sarahSamy)
                    ),
                    NotificationItem(
                        profileImageName: "ProfilePicture3",
                        message: L10n.Notifications.assignedMessage(L10n.Notifications.mohamedSamy)
                    ),
                ]
            ),
            NotificationSection(
                title: L10n.Tasks.friday,
                notifications: [
                    NotificationItem(
                        profileImageName: "ProfilePicture",
                        message: L10n.Notifications.assignedMessage(L10n.Notifications.mohamedSamy)
                    ),
                    NotificationItem(
                        profileImageName: "ProfilePicture2",
                        message: L10n.Notifications.assignedMessage(L10n.Notifications.mohamedSamy)
                    ),
                ]
            ),
        ]
    }
}
