//
//  LogInViewModelType.swift
//  ToDoList
//
//  Created by Mahmoud Alaa on 18/12/2025.
//

import Combine

// MARK: - Protocol
protocol LogInViewModelType: ObservableObject {
    // Inputs (Actions)
    func handleLogin()
    func handleGoogleLogin()
    func handleQRCodeLogin()
    func navigateToSignUp()
    
    // Outputs
    var isLoading: Bool { get set }
    var errorMessage: String? { get set }
    
}
