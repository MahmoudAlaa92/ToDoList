//
//  CreatedTaskDataProvider.swift
//  ToDoList
//
//  Created by Mahmoud Alaa on 19/12/2025.
//

import SwiftUI

// MARK: - Protocol
protocol CreatedTaskDataProviderProtocol {
    func fetchPlannedTasks() -> [PlannedModel]
    func fetchAssignedPersons() -> [Image]
}

// MARK: - Implementation
final class CreatedTaskDataProvider: CreatedTaskDataProviderProtocol {
    
    // MARK: - Singleton
    static let shared = CreatedTaskDataProvider()
    
    // MARK: - Initialization
    private init() {}
    
    // MARK: - Public Methods
    func fetchPlannedTasks() -> [PlannedModel] {
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
                title: L10n.Tasks.designSystemUpdates,
                subTitle: L10n.Tasks.uiComponents,
                day: L10n.Tasks.tomorrow,
                start: "9:00 \(L10n.Time.am)",
                end: "12:00 \(L10n.Time.pm)",
                imageName: "Mobile trading",
                colorSubTitle: Color.LightGray,
                colorCircle: Color.lightBeige,
                backgroundColor: Color.lightPink
            ),
        ]
    }
    
    func fetchAssignedPersons() -> [Image] {
        return [Images.woman, Images.teenagerGirl, Images.youngSmilingMan]
    }
}

// MARK: - Mock Data Provider (For Testing)
final class MockCreatedTaskDataProvider: CreatedTaskDataProviderProtocol {
    
    // MARK: - Properties
    var mockTasks: [PlannedModel] = []
    var mockPersons: [Image] = []
    
    // MARK: - Initialization
    init(tasks: [PlannedModel]? = nil, persons: [Image]? = nil) {
        self.mockTasks = tasks ?? defaultMockTasks()
        self.mockPersons = persons ?? defaultMockPersons()
    }
    
    // MARK: - Public Methods
    func fetchPlannedTasks() -> [PlannedModel] {
        return mockTasks
    }
    
    func fetchAssignedPersons() -> [Image] {
        return mockPersons
    }
    
    // MARK: - Private Methods
    private func defaultMockTasks() -> [PlannedModel] {
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
            ),
            .init(
                title: L10n.Tasks.designSystemUpdates,
                subTitle: L10n.Tasks.uiComponents,
                day: L10n.Tasks.tomorrow,
                start: "2:00 \(L10n.Time.pm)",
                end: "3:00 \(L10n.Time.pm)",
                imageName: "test2",
                colorSubTitle: Color.gray,
                colorCircle: Color.red,
                backgroundColor: Color.yellow
            ),
        ]
    }
    
    private func defaultMockPersons() -> [Image] {
        return [Images.profilePicture, Images.profilePicture2]
    }
}
