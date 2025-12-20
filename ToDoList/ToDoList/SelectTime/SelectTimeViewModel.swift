//
//  SelectTimeViewModel.swift
//  ToDoList
//
//  Created by Mahmoud Alaa on 21/12/2025.
//

import Combine
import Foundation

final class SelectTimeViewModel: SelectTimeViewModelType {
    // MARK: - Output Properties
    @Published private(set) var hour: Int
    @Published private(set) var minute: Int
    @Published private(set) var formattedTime: String = ""
    @Published private(set) var soundTitle: String = ""
    @Published private(set) var snoozeTitle: String = ""
    
    // MARK: - Dependencies
    private let dataProvider: TimeDataProviderProtocol
    private weak var coordinator: CoordinatorProtocol?
    
    // MARK: - Init
    init(dataProvider: TimeDataProviderProtocol, coordinator: CoordinatorProtocol?) {
        self.dataProvider = dataProvider
        self.coordinator = coordinator
        self.hour = dataProvider.getDefaultHour()
        self.minute = dataProvider.getDefaultMinute()
    }
    
    // MARK: - Input Methods
    func viewDidLoad() {
        soundTitle = dataProvider.getSoundSettings()
        snoozeTitle = dataProvider.getSnoozeSettings()
        updateFormattedTime()
    }
    
    func updateHour(_ hour: Int) {
        self.hour = hour
        updateFormattedTime()
    }
    
    func updateMinute(_ minute: Int) {
        self.minute = minute
        updateFormattedTime()
    }
    
    func backTapped() {
        coordinator?.dismissSheet()
    }
    
    func doneTapped() {
        dataProvider.saveTime(hour: hour, minute: minute)
        coordinator?.dismissSheet()
    }
    
    func closeTapped() {
        coordinator?.dismissSheet()
    }
    
    // MARK: - Private Methods
    private func updateFormattedTime() {
        let period = hour >= 12 ? "pm" : "am"
        let displayHour = hour == 0 ? 12 : (hour > 12 ? hour - 12 : hour)
        formattedTime = String(format: "%02d:%02d %@", displayHour, minute, period)
    }
}
