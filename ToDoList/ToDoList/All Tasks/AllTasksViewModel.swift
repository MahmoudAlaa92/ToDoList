//
//  AllTasksViewModel.swift
//  ToDoList
//
//  Created by Mahmoud Alaa on 02/11/2025.
//

import SwiftUI
import Combine

class AllTasksViewModel: ObservableObject {
    var days: [CalenderModel] = [
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

    @Published var prioritieItems: [PriorityModel] = [
        .init(title: "All", number: 10),
        .init(title: "High Priority", number: 4),
        .init(title: "Medium Priority", number: 6),
        .init(title: "Low Priority", number: 8),
        .init(title: "Not Priority", number: 8),
    ]

    @Published var prioritiesTasks: [PlannedModel] = [
    
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
