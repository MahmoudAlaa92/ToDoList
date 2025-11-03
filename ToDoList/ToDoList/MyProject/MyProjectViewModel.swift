//
//  MyProjectViewModel.swift
//  ToDoList
//
//  Created by Mahmoud Alaa on 03/11/2025.
//

import Foundation
import Combine

class MyProjectViewModel: ObservableObject {
    @Published var projectItems: [ProjectModel] = [
        .init(name: "bag", title: "Some Purchases", subTitle: "5 tasks"),
        .init(name: "cubes", title: "To Do List", subTitle: "3 tasks"),
        .init(name: "cubes", title: "To Do List", subTitle: "3 tasks"),
    ]
}
