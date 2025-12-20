//
//  SelectTimeViewModelType.swift
//  ToDoList
//
//  Created by Mahmoud Alaa on 21/12/2025.
//

import Combine

/// Input actions from View to ViewModel
protocol SelectTimeViewModelInput: ObservableObject {
    func viewDidLoad()
    func updateHour(_ hour: Int)
    func updateMinute(_ minute: Int)
    func backTapped()
    func doneTapped()
    func closeTapped()
}

/// Output data from ViewModel to View
protocol SelectTimeViewModelOutput: ObservableObject {
    var hour: Int { get }
    var minute: Int { get }
    var formattedTime: String { get }
    var soundTitle: String { get }
    var snoozeTitle: String { get }
}

/// Combined 
typealias SelectTimeViewModelType = SelectTimeViewModelInput & SelectTimeViewModelOutput
