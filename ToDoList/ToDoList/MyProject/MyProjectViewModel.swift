//
//  MyProjectViewModel.swift
//  ToDoList
//
//  Created by Mahmoud Alaa on 03/11/2025.
//

import Combine
import SwiftUI

class MyProjectViewModel: ObservableObject {
    @Published var projectItems: [PlannedModel] = [
        .init(
            title: "bag",
            subTitle: "5 tasks",
            day: "Friday",
            start: "10:00pm",
            end: "11:00pm",
            imageName: "bag",
            colorSubTitle: .darkGray,
            colorCircle: .darkPrimaryApp,
            backgroundColor: .lightPink
        ),
        .init(
            title: "To Do List",
            subTitle: "3 tasks",
            day: "Mondat",
            start: "10:00pm",
            end: "11:00pm",
            imageName: "cubes",
            colorSubTitle: .darkGray,
            colorCircle: .white,
            backgroundColor: .lightGreen
        ),

    ]
}
