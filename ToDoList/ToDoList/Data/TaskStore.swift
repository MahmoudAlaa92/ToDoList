//
//  TaskRepository.swift
//  ToDoList
//
//  Created by Mahmoud Alaa on 14/12/2025.
//

import SwiftUI
import Combine

protocol TaskStoreProtocol {
    func addTask(_ task: PlannedModel)
    func deleteTask(at index: Int)
    
    var tasksPublisher: AnyPublisher<[PlannedModel], Never> { get }
}

@MainActor
final class TaskStore: ObservableObject, TaskStoreProtocol {
    
    @Published var todaysTasks: [PlannedModel] = [
        .init(
            title: L10n.Tasks.clientReview,
            subTitle: L10n.Tasks.redesignApp,
            day: L10n.Tasks.friday,
            start: "1:00" + L10n.Time.pm,
            end: "4:00" + L10n.Time.pm,
            imageName: "Mobile trading",
            colorSubTitle: Color.LightGray,
            colorCircle: Color.lightBeige,
            backgroundColor: Color.lightPink
        ),
        .init(
            title: L10n.Tasks.codeReviewSession,
            subTitle: L10n.Projects.swift,
            day: L10n.Tasks.saturday,
            start: "10:00" + L10n.Time.pm,
            end: "11:00" + L10n.Time.pm,
            imageName: "cubes",
            colorSubTitle: Color.LightGray,
            colorCircle: Color.lightBeige,
            backgroundColor: Color.lightPink
        ),
    ]
    
    var tasksPublisher: AnyPublisher<[PlannedModel], Never> {
        $todaysTasks.eraseToAnyPublisher()
    }
    
    func addTask(_ task: PlannedModel) {
        todaysTasks.insert(task, at: 0)
    }
    
    func deleteTask(at index: Int) {
        guard todaysTasks.indices.contains(index) else { return }
        todaysTasks.remove(at: index)
    }
}
