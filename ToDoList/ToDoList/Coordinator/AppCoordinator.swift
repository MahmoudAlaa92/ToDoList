//
//  AppCoordinator.swift
//  ToDoList
//
//  Created by Mahmoud Alaa on 08/11/2025.
//

import SwiftUI
import Combine


final class AppCoordinator: ObservableObject {
    
    // MARK: - Published Properties
    
    // Auth navigation
    @Published var authPath = NavigationPath()
    
    // Tab-specific navigation paths
    @Published var homeTabPath = NavigationPath()
    @Published var todayTabPath = NavigationPath()
    @Published var addTaskPath = NavigationPath()
    @Published var prioritiesTabPath = NavigationPath()
    @Published var plannedTabPath = NavigationPath()
    
    // Modal presentations
    @Published var sheet: ModalRoute?
    @Published var fullScreen: AuthRoute?
    
    // App state
    @Published var isAuthenticated = false
    @Published var currentAppState: AppState = .main
    
    // MARK: - App State
    
    enum AppState {
        case auth
        case main
    }
    
    // MARK: - Init
    
    init() {
        checkAuthState()
    }
    
    // MARK: - Auth State Management
    
    private func checkAuthState() {
        isAuthenticated = UserDefaults.standard.bool(forKey: "isAuthenticated")
        
        if isAuthenticated {
            currentAppState = .main
        } else {
            currentAppState = .main
        }
    }
    
    func completeSplash() {
        withAnimation {
            currentAppState = .auth
        }
    }
    
    func login() {
        isAuthenticated = true
        UserDefaults.standard.set(true, forKey: "isAuthenticated")
        
        withAnimation {
            currentAppState = .main
        }
        
        dismissFullScreen()
        resetAuthPath()
    }
    
    func logout() {
        isAuthenticated = false
        UserDefaults.standard.set(false, forKey: "isAuthenticated")
        
        resetAllPaths()
        
        withAnimation {
            currentAppState = .auth
        }
    }
    
    // MARK: - Auth Navigation
    
    func pushAuth(_ route: AuthRoute) {
        authPath.append(route)
    }
    
    func goBackAuth() {
        guard !authPath.isEmpty else { return }
        authPath.removeLast()
    }
    
    func resetAuthPath() {
        authPath = NavigationPath()
    }
    
    func resetAllPaths() {
        authPath = NavigationPath()
        homeTabPath = NavigationPath()
        todayTabPath = NavigationPath()
        prioritiesTabPath = NavigationPath()
        plannedTabPath = NavigationPath()
    }
    
    // MARK: - Convenience Methods
    
    func showAddTask() {
        presentSheet(.addTask)
    }
    
    func navigateToSignup() {
        pushAuth(.signup)
    }
}
// MARK: - Tab Navigation
//
extension AppCoordinator {
    
    func pushToHomeTab(_ route: HomeTabRoute) {
        homeTabPath.append(route)
    }
    
    func pushToTodayTab(_ route: TodayTabRoute) {
        todayTabPath.append(route)
    }
    
    func addTaskTab(_ route: AddTaskRoute) {
        addTaskPath.append(route)
    }
    
    func pushToPrioritiesTab(_ route: PrioritiesTabRoute) {
        prioritiesTabPath.append(route)
    }
    
    func pushToPlannedTab(_ route: PlannedTabRoute) {
        plannedTabPath.append(route)
    }
    
    func goBack(from tab: Tabs) {
        switch tab {
        case .home:
            guard !homeTabPath.isEmpty else { return }
            homeTabPath.removeLast()
        case .today:
            guard !todayTabPath.isEmpty else { return }
            todayTabPath.removeLast()
        case .addTask:
            guard !addTaskPath.isEmpty else { return }
            addTaskPath.removeLast()
        case .prioritiesTask:
            guard !prioritiesTabPath.isEmpty else { return }
            prioritiesTabPath.removeLast()
        case .planned:
            guard !plannedTabPath.isEmpty else { return }
            plannedTabPath.removeLast()
        }
    }
    
    func popToRoot(tab: Tabs) {
        switch tab {
        case .home:
            homeTabPath = NavigationPath()
        case .today:
            todayTabPath = NavigationPath()
        case .addTask:
            addTaskPath = NavigationPath()
        case .prioritiesTask:
            prioritiesTabPath = NavigationPath()
        case .planned:
            plannedTabPath = NavigationPath()
        }
    }
}
// MARK: - Modal Presentations
//
extension AppCoordinator {
    func presentSheet(_ route: ModalRoute) {
        sheet = route
    }
    
    func dismissSheet() {
        sheet = nil
    }
    
    func presentFullScreen(_ route: AuthRoute) {
        fullScreen = route
    }
    
    func dismissFullScreen() {
        fullScreen = nil
    }
}
