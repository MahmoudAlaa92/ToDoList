//
//  NotificationModel.swift
//  ToDoList
//
//  Created by Mahmoud Alaa on 19/12/2025.
//

import Foundation

// MARK: - Notification Item Model
struct NotificationItem: Identifiable, Hashable {
    let id: String
    let profileImageName: String
    let message: String
    let timestamp: Date
    
    init(id: String = UUID().uuidString, profileImageName: String, message: String, timestamp: Date = Date()) {
        self.id = id
        self.profileImageName = profileImageName
        self.message = message
        self.timestamp = timestamp
    }
}

// MARK: - Notification Section Model
struct NotificationSection: Identifiable {
    let id: String
    let title: String
    let notifications: [NotificationItem]
    
    init(id: String = UUID().uuidString, title: String, notifications: [NotificationItem]) {
        self.id = id
        self.title = title
        self.notifications = notifications
    }
}
