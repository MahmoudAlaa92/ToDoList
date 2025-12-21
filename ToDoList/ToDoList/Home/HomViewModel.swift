//
//  HomViewModel.swift
//  ToDoList
//
//  Created by Mahmoud Alaa on 09/11/2025.
//

import SwiftUI
import Combine

// MARK: - ViewModel Implementation

@MainActor
final class HomeViewModel: HomeViewModelType {
    // MARK: - Output Properties
    @Published private(set) var days: [CalenderModel] = []
    @Published private(set) var todaysTasks: [PlannedModel] = []
    @Published private(set) var projects: [PlannedModel] = []
    @Published private(set) var isLoading: Bool = false
    
    // MARK: - Dependencies
    private let dataProvider: HomeDataProviderProtocol
    private var cancellables = Set<AnyCancellable>()
    
    // MARK: - Initialization
    init(dataProvider: HomeDataProviderProtocol) {
        self.dataProvider = dataProvider
    }
    
    // MARK: - Input Methods
    func viewDidLoad() {
        loadInitialData()
        observeTodaysTasks()
    }
    
    func deleteTask(at index: Int) {
        guard index < todaysTasks.count else { return }
        dataProvider.deleteTask(at: index)
    }
    
    func refreshData() {
        loadInitialData()
    }
    
    // MARK: - Private Methods
    private func loadInitialData() {
        isLoading = true
        
        days = dataProvider.getCalendarDays()
        projects = dataProvider.getProjects()
        
        isLoading = false
    }
    
    private func observeTodaysTasks() {
        dataProvider.observeTodaysTasks()
            .receive(on: DispatchQueue.main)
            .sink { [weak self] tasks in
                self?.todaysTasks = tasks
            }
            .store(in: &cancellables)
    }
}
