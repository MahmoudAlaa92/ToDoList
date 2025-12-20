//
//  SelectTimeFactory.swift
//  ToDoList
//
//  Created by Mahmoud Alaa on 21/12/2025.
//

import Foundation

struct SelectTimeFactory {
    static func create(coordinator: CoordinatorProtocol?) -> SelectTimeView {
        let dataProvider = TimeDataProvider()
        let viewModel = SelectTimeViewModel(
            dataProvider: dataProvider,
            coordinator: coordinator
        )
        return SelectTimeView(viewModel: viewModel)
    }
}
