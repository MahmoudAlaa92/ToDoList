//
//  MockLoginViewModel.swift
//  ToDoList
//
//  Created by Mahmoud Alaa on 18/12/2025.
//

import Combine

// MARK: - Mock ViewModel for Previews/Testing
@MainActor
class MockLoginViewModel: LogInViewModelType {
    @Published var isLoading = false
    @Published var errorMessage: String?
    
    func handleLogin() {
        print("Mock: Login tapped")
    }
    
    func handleGoogleLogin() {
        print("Mock: Google login tapped")
    }
    
    func handleQRCodeLogin() {
        print("Mock: QR code login tapped")
    }
    
    func navigateToSignUp() {
        print("Mock: Navigate to sign up")
    }
}
