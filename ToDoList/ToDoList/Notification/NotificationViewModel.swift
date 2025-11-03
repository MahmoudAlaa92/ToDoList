//
//  NotificationViewModel.swift
//  ToDoList
//
//  Created by Mahmoud Alaa on 03/11/2025.
//

import Combine
import Foundation

class NotificationViewModel: ObservableObject {

    @Published var notificationItem: [String: [String: String]] = [
        "Today": [
            "ProfilePicture": "Mohamed Samy assign to  you in a new project"
        ],
        "Yesterday": [
            "ProfilePicture": "Mohamed Samy assign to  you in a new project",
            "ProfilePicture2": "Sarah Samy assign to  you in a new project",
            "ProfilePicture3": "Mohamed Samy assign to  you in a new project",
        ],
        "Friday": [
            "ProfilePicture": "Mohamed Samy assign to  you in a new project",
            "ProfilePicture2": "Mohamed Samy assign to  you in a new project",
        ],
    ]

}
