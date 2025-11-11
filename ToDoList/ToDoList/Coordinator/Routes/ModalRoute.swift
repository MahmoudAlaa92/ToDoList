//
//  ModalRoute.swift
//  ToDoList
//
//  Created by Mahmoud Alaa on 09/11/2025.
//

import SwiftUI

enum ModalRoute: Route, ViewBuildable {
    case addTask
    
    var id: String {
        switch self {
        case .addTask: return "modal-add-task"
        }
    }
    
    @ViewBuilder
    func makeView(coordinator: AppCoordinator) -> some View {
        switch self {
        case .addTask:
            AddTask(coordinator: coordinator)

        }
    }
}
