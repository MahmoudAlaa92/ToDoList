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
            .init(day: L10n.Calendar.sunday, number: 1, progress: 0.0),
            .init(day: L10n.Calendar.monday, number: 2, progress: 0.0),
            .init(day: L10n.Calendar.tuesday, number: 3, progress: 0.0),
            .init(day: L10n.Calendar.wednesday, number: 4, progress: 1),
            .init(day: L10n.Calendar.thursday, number: 5, progress: 0.0),
            .init(day: L10n.Calendar.friday, number: 6, progress: 0.0),
            .init(day: L10n.Calendar.saturday, number: 7, progress: 0.0),
            .init(day: L10n.Calendar.sunday, number: 8, progress: 0.0),
            .init(day: L10n.Calendar.monday, number: 9, progress: 0.0),
            .init(day: L10n.Calendar.tuesday, number: 10, progress: 0.0),
            .init(day: L10n.Calendar.wednesday, number: 11, progress: 0),
            .init(day: L10n.Calendar.thursday, number: 12, progress: 0.0),
            .init(day: L10n.Calendar.friday, number: 13, progress: 0.0),
        ]
    }
    
    func fetchPriorityItems() -> [PriorityModel] {
        return [
            .init(title: L10n.Tasks.all, number: 6),
            .init(title: L10n.Tasks.highPriority, number: 4),
            .init(title: L10n.Tasks.mediumPriority, number: 6),
            .init(title: L10n.Tasks.lowPriority, number: 3),
            .init(title: L10n.Tasks.notPriority, number: 4),
        ]
    }
    
    func fetchTasks() -> [PlannedModel] {
        return [
            .init(
                title: L10n.Tasks.clientReview,
                subTitle: L10n.Tasks.redesignApp,
                day: L10n.Tasks.today,
                start: "10:00 \(L10n.Time.am)",
                end: "4:00 \(L10n.Time.pm)",
                imageName: "Mobile trading",
                colorSubTitle: Color.LightGray,
                colorCircle: Color.lightBeige,
                backgroundColor: Color.lightPink
            ),
            .init(
                title: L10n.Tasks.clientReviewShort,
                subTitle: L10n.Tasks.redesignApp,
                day: L10n.Tasks.today,
                start: "10:00 \(L10n.Time.am)",
                end: "4:00 \(L10n.Time.pm)",
                imageName: "cubes",
                colorSubTitle: Color.LightGray,
                colorCircle: Color.lightBeige,
                backgroundColor: Color.lightPink
            ),
            .init(
                title: L10n.Tasks.clientReview,
                subTitle: L10n.Tasks.redesignApp,
                day: L10n.Tasks.today,
                start: "10:00 \(L10n.Time.am)",
                end: "4:00 \(L10n.Time.pm)",
                imageName: "Mobile trading",
                colorSubTitle: Color.LightGray,
                colorCircle: Color.lightBeige,
                backgroundColor: Color.lightPink
            ),
            .init(
                title: L10n.Tasks.clientReviewShort,
                subTitle: L10n.Tasks.redesignApp,
                day: L10n.Tasks.today,
                start: "10:00 \(L10n.Time.am)",
                end: "4:00 \(L10n.Time.pm)",
                imageName: "cubes",
                colorSubTitle: Color.LightGray,
                colorCircle: Color.lightBeige,
                backgroundColor: Color.lightPink
            ),
            .init(
                title: L10n.Tasks.clientReview,
                subTitle: L10n.Tasks.redesignApp,
                day: L10n.Tasks.today,
                start: "10:00 \(L10n.Time.am)",
                end: "4:00 \(L10n.Time.pm)",
                imageName: "Mobile trading",
                colorSubTitle: Color.LightGray,
                colorCircle: Color.lightBeige,
                backgroundColor: Color.lightPink
            ),
            .init(
                title: L10n.Tasks.clientReviewShort,
                subTitle: L10n.Tasks.redesignApp,
                day: L10n.Tasks.today,
                start: "10:00 \(L10n.Time.am)",
                end: "4:00 \(L10n.Time.pm)",
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
            .init(day: L10n.Calendar.monday, number: 1, progress: 0.5),
            .init(day: L10n.Calendar.tuesday, number: 2, progress: 0.8),
        ]
    }
    
    func fetchPriorityItems() -> [PriorityModel] {
        return [
            .init(title: L10n.Tasks.all, number: 1)
        ]
    }
    
    func fetchTasks() -> [PlannedModel] {
        return [
            .init(
                title: L10n.Tasks.clientReview,
                subTitle: L10n.Tasks.redesignApp,
                day: L10n.Tasks.today,
                start: "9:00 \(L10n.Time.am)",
                end: "10:00 \(L10n.Time.am)",
                imageName: "test",
                colorSubTitle: Color.gray,
                colorCircle: Color.blue,
                backgroundColor: Color.green
            )
        ]
    }
}
