//
//  MyProjectViewModel.swift
//  ToDoList
//
//  Created by Mahmoud Alaa on 03/11/2025.
//

import Combine
import SwiftUI

//var colorSubTitle: Color = Color.darkGray
//var colorCircle: Color = Color.lightPink
//var backgroundColor: Color = Color.lightBeige
class MyProjectViewModel: ObservableObject {
    @Published var projectItems: [ProjectModel] = [
        .init(
            name: "bag",
            title: "Some Purchases",
            subtitle: "5 tasks",
            colorSubTitle: .darkGray,
            colorCircle: .darkPrimaryApp,
            backgroundColor: .lightPink
        ),
        .init(
            name: "cubes",
            title: "To Do List",
            subtitle: "3 tasks",
            colorSubTitle: .darkGray,
            colorCircle: .white,
            backgroundColor: .lightGreen
        ),

    ]
}
