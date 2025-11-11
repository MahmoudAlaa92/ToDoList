//
//  HomViewModel.swift
//  ToDoList
//
//  Created by Mahmoud Alaa on 09/11/2025.
//

import Combine
import SwiftUI

class HomeViewModel: ObservableObject {
    var days: [CalenderModel] = [
        .init(day: "Sun", number: 1, progress: 0.9),
        .init(day: "Mon", number: 2, progress: 0.6),
        .init(day: "Tue", number: 3, progress: 0.4),
        .init(day: "Wed", number: 4, progress: 1),
        .init(day: "Thu", number: 5, progress: 0.8),
        .init(day: "Fri", number: 6, progress: 0.4),
        .init(day: "Sat", number: 7, progress: 0.7),
        .init(day: "Sun", number: 8, progress: 0.9),
        .init(day: "Mon", number: 9, progress: 0.6),
        .init(day: "Tue", number: 10, progress: 0.4),
        .init(day: "Wed", number: 11, progress: 1),
        .init(day: "Thu", number: 12, progress: 0.8),
        .init(day: "Fri", number: 13, progress: 0.4),
    ]
    
    var todaysTask: [PlannedModel] = [
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
    
    var projectCells: [ProjectCell] = [
        ProjectCell(
            projectItem: .init(
                name: "bag",
                title: "Some Purchases",
                subtitle: "5 tasks",
                colorSubTitle: .LightGray,
                colorCircle: .white,
                backgroundColor: .lightPink
            )
        ),
        ProjectCell(
            projectItem: .init(
                name: "cubes",
                title: "To Do List",
                subtitle: "3 tasks",
                colorSubTitle: .LightGray,
                colorCircle: .darkGreen,
                backgroundColor: .lightGreen
            )
        ),
    ]
    
}
