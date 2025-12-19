//
//  AllTasksDataProvider.swift
//  ToDoList
//
//  Created by Mahmoud Alaa on 19/12/2025.
//

import SwiftUI

protocol AllTasksDataProviderProtocol {
    func fetchCalendarDays() -> [CalenderModel]
    func fetchPriorityItems() -> [PriorityModel]
    func fetchTasks() -> [PlannedModel]
}

final class AllTasksDataProvider: AllTasksDataProviderProtocol {
    
    // MARK: - Singleton 
    static let shared = AllTasksDataProvider()
    
    private init() {}
    
    // MARK: - Fetch Methods
    func fetchCalendarDays() -> [CalenderModel] {
        return [
            .init(day: "Sun", number: 1, progress: 0.0),
            .init(day: "Mon", number: 2, progress: 0.0),
            .init(day: "Tue", number: 3, progress: 0.0),
            .init(day: "Wed", number: 4, progress: 1),
            .init(day: "Thu", number: 5, progress: 0.0),
            .init(day: "Fri", number: 6, progress: 0.0),
            .init(day: "Sat", number: 7, progress: 0.0),
            .init(day: "Sun", number: 8, progress: 0.0),
            .init(day: "Mon", number: 9, progress: 0.0),
            .init(day: "Tue", number: 10, progress: 0.0),
            .init(day: "Wed", number: 11, progress: 0),
            .init(day: "Thu", number: 12, progress: 0.0),
            .init(day: "Fri", number: 13, progress: 0.0),
        ]
    }
    
    func fetchPriorityItems() -> [PriorityModel] {
        return [
            .init(title: "All", number: 6),
            .init(title: "High Priority", number: 4),
            .init(title: "Medium Priority", number: 6),
            .init(title: "Low Priority", number: 3),
            .init(title: "Not Priority", number: 4),
        ]
    }
    
    func fetchTasks() -> [PlannedModel] {
        return [
            .init(
                title: "Client Review &Feedback",
                subTitle: "Redesign App",
                day: "Today",
                start: "10:00 am",
                end: "4:00 pm",
                imageName: "Mobile trading",
                colorSubTitle: Color.LightGray,
                colorCircle: Color.lightBeige,
                backgroundColor: Color.lightPink
            ),
            .init(
                title: "Client Review",
                subTitle: "Redesign App",
                day: "Today",
                start: "10:00 am",
                end: "4:00 pm",
                imageName: "cubes",
                colorSubTitle: Color.LightGray,
                colorCircle: Color.lightBeige,
                backgroundColor: Color.lightPink
            ),
            .init(
                title: "Client Review &Feedback",
                subTitle: "Redesign App",
                day: "Today",
                start: "10:00 am",
                end: "4:00 pm",
                imageName: "Mobile trading",
                colorSubTitle: Color.LightGray,
                colorCircle: Color.lightBeige,
                backgroundColor: Color.lightPink
            ),
            .init(
                title: "Client Review",
                subTitle: "Redesign App",
                day: "Today",
                start: "10:00 am",
                end: "4:00 pm",
                imageName: "cubes",
                colorSubTitle: Color.LightGray,
                colorCircle: Color.lightBeige,
                backgroundColor: Color.lightPink
            ),
            .init(
                title: "Client Review &Feedback",
                subTitle: "Redesign App",
                day: "Today",
                start: "10:00 am",
                end: "4:00 pm",
                imageName: "Mobile trading",
                colorSubTitle: Color.LightGray,
                colorCircle: Color.lightBeige,
                backgroundColor: Color.lightPink
            ),
            .init(
                title: "Client Review",
                subTitle: "Redesign App",
                day: "Today",
                start: "10:00 am",
                end: "4:00 pm",
                imageName: "cubes",
                colorSubTitle: Color.LightGray,
                colorCircle: Color.lightBeige,
                backgroundColor: Color.lightPink
            ),
        ]
    }
}

// MARK: - Mock Data Provider (For Testing)
final class MockAllTasksDataProvider: AllTasksDataProviderProtocol {
    func fetchCalendarDays() -> [CalenderModel] {
        return [
            .init(day: "Mon", number: 1, progress: 0.5),
            .init(day: "Tue", number: 2, progress: 0.8),
        ]
    }
    
    func fetchPriorityItems() -> [PriorityModel] {
        return [
            .init(title: "Test Priority", number: 1)
        ]
    }
    
    func fetchTasks() -> [PlannedModel] {
        return [
            .init(
                title: "Test Task",
                subTitle: "Test Subtitle",
                day: "Today",
                start: "9:00 am",
                end: "10:00 am",
                imageName: "test",
                colorSubTitle: Color.gray,
                colorCircle: Color.blue,
                backgroundColor: Color.green
            )
        ]
    }
}
