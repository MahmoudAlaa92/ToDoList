//
//  CreatedTaskViewModel.swift
//  ToDoList
//
//  Created by Mahmoud Alaa on 11/11/2025.
//

import Combine
import SwiftUI

class CreatedTaskViewModel: ObservableObject {
    @Published var plannedCompleted: [PlannedModel] = [
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
