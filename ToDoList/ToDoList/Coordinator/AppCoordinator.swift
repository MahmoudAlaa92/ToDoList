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
    
    @Published private(set) var tabPaths: [Tabs: NavigationPath] = [
        .home: NavigationPath(),
        .today: NavigationPath(),
        .addTask: NavigationPath(),
        .prioritiesTask: NavigationPath(),
        .planned: NavigationPath()
    ]
    
    // Convenience computed properties for backward compatibility
    var homeTabPath: NavigationPath {
        get { tabPaths[.home] ?? NavigationPath() }
        set { tabPaths[.home] = newValue }
    }
    
    var todayTabPath: NavigationPath {
        get { tabPaths[.today] ?? NavigationPath() }
        set { tabPaths[.today] = newValue }
    }
    
    var addTaskPath: NavigationPath {
        get { tabPaths[.addTask] ?? NavigationPath() }
        set { tabPaths[.addTask] = newValue }
    }
    
    var prioritiesTabPath: NavigationPath {
        get { tabPaths[.prioritiesTask] ?? NavigationPath() }
        set { tabPaths[.prioritiesTask] = newValue }
    }
    
    var plannedTabPath: NavigationPath {
        get { tabPaths[.planned] ?? NavigationPath() }
        set { tabPaths[.planned] = newValue }
    }
    
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
        
        tabPaths = [
            .home: NavigationPath(),
            .today: NavigationPath(),
            .addTask: NavigationPath(),
            .prioritiesTask: NavigationPath(),
            .planned: NavigationPath()
        ]
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
    func push<R: TabIdentifiable>(_ route: R) where R: Hashable {
        let tab = route.tab
        tabPaths[tab]?.append(route)
    }
    
    /// Universal push method using type erasure
    func push(_ route: any (Route & ViewBuildable & TabIdentifiable)) {
        let tab = route.tab
        tabPaths[tab]?.append(route)
    }
    
    /// Dynamic go back without switch case
    func goBack(from tab: Tabs) {
        guard let path = tabPaths[tab], !path.isEmpty else { return }
        tabPaths[tab]?.removeLast()
    }
    
    /// Dynamic pop to root without switch case
    func popToRoot(tab: Tabs) {
        tabPaths[tab] = NavigationPath()
    }
}
// MARK: - Push this Views for any tab
//
extension AppCoordinator {
    /// Push notification route for any tab
    func pushNotification(for tab: Tabs) {
        let route = CoordintorRouteFactory.createNotificationRoute(for: tab)
        push(route)
    }
    
    /// Push project details route for any tab
    func pushProjectDetails(for tab: Tabs, taskCard: PlannedModel) {
        let route = CoordintorRouteFactory.createProjectDetailsRoute(for: tab, taskCard: taskCard)
        push(route)
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
