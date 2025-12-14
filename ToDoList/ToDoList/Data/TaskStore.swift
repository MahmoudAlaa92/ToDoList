//
//  TaskRepository.swift
//  ToDoList
//
//  Created by Mahmoud Alaa on 14/12/2025.
//

import SwiftUI
import Combine

protocol TaskStoreProtocol {
    var todaysTasks: AnyPublisher<[PlannedModel], Never> { get }
    func addTask(_ task: PlannedModel)
    func deleteTask(at index: Int)
}

@MainActor
final class TaskStore: ObservableObject {

    @Published var todaysTasks: [PlannedModel] = [
        .init(
            title: "Client Review &Feedback",
            subTitle: "Redesing my work",
            day: "Friday",
            start: "1:00pm",
            end: "4:00pm",
            imageName: "Mobile trading",
            colorSubTitle: Color.LightGray,
            colorCircle: Color.lightBeige,
            backgroundColor: Color.lightPink
        ),
        .init(
            title: "Reivew My Work",
            subTitle: "Swift",
            day: "Saturday",
            start: "10:00pm",
            end: "11:00pm",
            imageName: "cubes",
            colorSubTitle: Color.LightGray,
            colorCircle: Color.lightBeige,
            backgroundColor: Color.lightPink
        ),
    ]

    func addTask(_ task: PlannedModel) {
        todaysTasks.insert(task, at: 0)
    }

    func deleteTask(at index: Int) {
        guard todaysTasks.indices.contains(index) else { return }
        todaysTasks.remove(at: index)
    }
}
