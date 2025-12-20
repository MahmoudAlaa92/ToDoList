//
//  NotificationViewModelType.swift
//  ToDoList
//
//  Created by Mahmoud Alaa on 19/12/2025.
//

import Combine

// MARK: - Input Protocol
protocol NotificationViewModelInput: ObservableObject {
    func didTapBack()
    func didTapMoreOptions()
    func didTapNotification(_ notification: NotificationItem)
    func markAsRead(_ notification: NotificationItem)
    func deleteNotification(_ notification: NotificationItem)
}

// MARK: - Output Protocol
protocol NotificationViewModelOutput: ObservableObject {
    var notificationSections: [NotificationSection] { get }
    var sourceTab: Tabs { get }
}

// MARK: - Protocol with Coordinator
protocol NotificationViewModelType: NotificationViewModelInput, NotificationViewModelOutput {
    var coordinator: CoordinatorProtocol? { get set }    
}
