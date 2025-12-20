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
                title: "Today",
                notifications: [
                    NotificationItem(
                        profileImageName: "ProfilePicture",
                        message: "Mohamed Samy assign to you in a new project"
                    )
                ]
            ),
            NotificationSection(
                title: "Yesterday",
                notifications: [
                    NotificationItem(
                        profileImageName: "ProfilePicture",
                        message: "Mohamed Samy assign to you in a new project"
                    ),
                    NotificationItem(
                        profileImageName: "ProfilePicture2",
                        message: "Sarah Samy assign to you in a new project"
                    ),
                    NotificationItem(
                        profileImageName: "ProfilePicture3",
                        message: "Mohamed Samy assign to you in a new project"
                    ),
                ]
            ),
            NotificationSection(
                title: "Friday",
                notifications: [
                    NotificationItem(
                        profileImageName: "ProfilePicture",
                        message: "Mohamed Samy assign to you in a new project"
                    ),
                    NotificationItem(
                        profileImageName: "ProfilePicture2",
                        message: "Mohamed Samy assign to you in a new project"
                    ),
                ]
            ),
        ]
    }
}
