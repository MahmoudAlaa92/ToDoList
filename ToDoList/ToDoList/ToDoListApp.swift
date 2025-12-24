//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by Mahmoud Alaa on 30/10/2025.
//

import SwiftUI

@main
struct ToDoListApp: App {
    @StateObject private var taskStore = TaskStore()
    @State private var showLaunchScreen = true
    
    var body: some Scene {
        WindowGroup {
            if showLaunchScreen {
                SplashScreenView()
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                            showLaunchScreen = false
                        }}
            } else {
                AppCoordinatorView()
                    .environmentObject(taskStore)
            }
        }
    }
}
