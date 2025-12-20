//
//  TimeDataProvider.swift
//  ToDoList
//
//  Created by Mahmoud Alaa on 21/12/2025.
//

import Combine

/// Data Provider Protocol
protocol TimeDataProviderProtocol {
    func getDefaultHour() -> Int
    func getDefaultMinute() -> Int
    func getSoundSettings() -> String
    func getSnoozeSettings() -> String
    func saveTime(hour: Int, minute: Int)
}

// MARK: - Data Provider Implementation

final class TimeDataProvider: TimeDataProviderProtocol {
    func getDefaultHour() -> Int {
        return 3
    }
    
    func getDefaultMinute() -> Int {
        return 24
    }
    
    func getSoundSettings() -> String {
        return "iphone sound"
    }
    
    func getSnoozeSettings() -> String {
        return "10 min to 20 min"
    }
    
    func saveTime(hour: Int, minute: Int) {
        // Save to UserDefaults, database, etc.
        print("Saving time: \(hour):\(minute)")
    }
}
